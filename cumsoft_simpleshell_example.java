import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class ModularJavaShell {
    private Map<String, CommandFunction> commandFunctions;

    public ModularJavaShell() {
        commandFunctions = new HashMap<>();
        commandFunctions.put("hello", this::sayHello);
        commandFunctions.put("add", this::addNumbers);
        // Add more commands and functions as needed
    }

    public void run() {
        Scanner scanner = new Scanner(System.in);

        while (true) {
            System.out.print("> ");
            String input = scanner.nextLine();

            if (input.equalsIgnoreCase("exit")) {
                break;
            }

            String[] tokens = input.split("\\s+");
            if (tokens.length > 0) {
                String command = tokens[0];
                if (commandFunctions.containsKey(command)) {
                    String[] args = new String[tokens.length - 1];
                    System.arraycopy(tokens, 1, args, 0, args.length);
                    commandFunctions.get(command).execute(args);
                } else {
                    System.out.println("Unknown command: " + command);
                }
            }
        }
    }

    private void sayHello(String[] args) {
        System.out.println("Hello, world!");
    }

    private void addNumbers(String[] args) {
        if (args.length != 2) {
            System.out.println("Usage: add <number1> <number2>");
            return;
        }
        try {
            int num1 = Integer.parseInt(args[0]);
            int num2 = Integer.parseInt(args[1]);
            int sum = num1 + num2;
            System.out.println("Sum: " + sum);
        } catch (NumberFormatException e) {
            System.out.println("Invalid numbers.");
        }
    }

    public static void main(String[] args) {
        ModularJavaShell shell = new ModularJavaShell();
        shell.run();
    }

    private interface CommandFunction {
        void execute(String[] args);
    }
}