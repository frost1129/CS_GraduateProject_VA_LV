import { ClientLayout } from "@/lib/components/layouts";
import Posts from "./components/posts";

const HomePage = () => {
  return (
    <ClientLayout>
      <Posts />
    </ClientLayout>
  );
};

export default HomePage;
