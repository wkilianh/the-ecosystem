import consumer from "./consumer";

const initConversationCable = () => {
  const messagesContainer = document.getElementById('messages');
  
  if (messagesContainer) {
    messagesContainer.lastElementChild.scrollIntoView();
    const id = messagesContainer.dataset.conversationId;
    consumer.subscriptions.create({ channel: "ConversationChannel", id: id }, {
      received(data) {
        messagesContainer.insertAdjacentHTML('beforeend', data);
        messagesContainer.lastElementChild.scrollIntoView()
      },
    });
  }
}

export { initConversationCable };
