Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794986829;
	b=1ZEUdNY3fNW9mhrRB+p2SjT1rinKV1i0LQtnl2+SxYhqvdy41tqjwc/NEwolCN8K3kd0
	 D1e6k1vAcF6gA0cCWenB4vUZ9LbK333ljVbqoW2BIWCufEJ92cYyKZZPtynGvV2IVoO2c
	 UIAY2P+4+hSFLvwPCdni8CT7vuz2sek/xWuecS5QMOB7iqhHQpBqkV//rTVYPXf7jssut
	 ddKdvDuqMuAiapTUG6lS59XaxunZvuSZm0b7chc3RbGabizXKhEnrChrtVdLUcjEQ2/B8
	 Nn0fclNVmpzpfRDkScVtL5bsUwSRpGczS2SM4spru+G+2e0W6y/aiMtxpcd0hXV/zpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794986829;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=gmvbVp6faEXvDlLMjXYC745ZB8kPjAh6JMcn8m79P6Q=;
	b=PHoUutLlj8PibmgKxkB/wUhtFDip9BnizaJEKRzRPQ+5eMn2bDg5HdT1RuQ1lVBA/OB2
	 CfEA5JMs2Vf/xPaJcCzvl9SBOXAaPI8XclcVRyalm/l9to9BOEYzvVw0+RMqsNFM5SeKM
	 jSA12fA/81AGr64vI3baIMDDDusTorH4TiHVNC2CAXiLoGsrlSP6WLHh3EB+/fCShCd0V
	 w4jHZ1tarQnFc76/AEBeNkN017xGAQtm9wPsPeiZ8riHjJ/8z/RmzWpFbfM2BxZHxffau
	 HLORCxPlokOZh6/4aa2Bj6P8DcVNoQUNHLVnc1PfWk9YvcVMKKu7UnyYKMhFf3ipKYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=0B+cGqjb;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D94606A32C
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 07:27:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67D94606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=0B+cGqjb
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so463821f8f.1
        for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 23:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794986828; x=1795591628; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gmvbVp6faEXvDlLMjXYC745ZB8kPjAh6JMcn8m79P6Q=;
        b=0B+cGqjbNeLds2u708MQ9QyK9g6VNvjwPsuRUJq3bfhI9l/7ddRFXaWUsnu/SrAURD
         HvPBNaigvjLBHsFy3Y0fB4WuGaCk3K9VxGUexCZR556zHTSyX73fDHJnmAGfSZywagdu
         DUXq46bBEFPP1Gk2H7J80Pdvx+G9rctCCSbeCv3EfkcTFyKzZZWVO05JuKbfO/tFynaA
         G+t8Dp4Y3RN57/mzW3DaJDmVCjVWHA5LnnK+egIZYuxf1laxqzHJhRpgZtKkjO4mT+mv
         1xzy629pmMOPAEKGTPxIWk408ZbDKBmx209t9pZn6hzgKTH0C0RY1bmZTrBeBFvAqV8h
         +Uug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794986828; x=1795591628;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gmvbVp6faEXvDlLMjXYC745ZB8kPjAh6JMcn8m79P6Q=;
        b=QvrXEvLQ5gSiRsIDN0kz/hQEIlEGieIUqnM+w26YARuQbfhbbPjjY7bL9UEur12YtH
         pAnfkUpK1W71wElM/Tf1v5dm5TxuazGIZP+MYoTvhJBXeYUWyF0trTNP9NswqrrYUtQe
         N/RQCoZFoNL1UXQXuQAuopM+MmEda9Bhi/X68e4OL4otfuu50R6CoyeS1Kwo7kMZJcfn
         ailpymf0qy1cJGFIyzbDMkJUnwUmZ/KV5bPDcQdjEAXyzrX/GSjl9n4OFEWzOuB2LZRW
         g4n21/MSfQUkFq6Lv0N3yAnNMJMvskYkyBP+0V8TtWEhZgWG7Vdylur9aBBjEoZVBWnD
         6a+g==
X-Forwarded-Encrypted: i=1; AL+hErEq73ScmMnSM6Sp8JTT7HnNUcyCzSAuYobAySShVrmY2qvLREVwCRwyfxC6nZIrZ615wsTDkgW088k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WCKr6O++5OfczKOailXJMLrY+6rOPZTaXJVU//4HAq6zqBQtm
	EgTCk8GzadbCSxJpvbFFEBghJTe0E8sDDOBwkRRa1H7Mm+hX5RYQw1ux/3p5nLy+G14=
X-Gm-Gg: AZFdTZcKlp1yN0iMudHHeEMXK/7GkfBPBX/+zYpKLYQT4nqO2HV8/WiQXcXDYPnz3GD
	bC2J8pfi19ZnNpjvsGNLj3r81MPBriIEAsTgFetR6WQ2+kFsg0moo7Cr3QkOeyplyNZpnS4Ta1g
	D7+zfrLqYzC1u4+cEgaWX/lQeGCZxLgOfBMbk+Oq99LAratoINYXyT41cFVEpJj3FvlLwrUZv+I
	dt+zc85KMDa5oG3swDMubX7ny1ngQiE8FqBweHRIehKD+smomz2fXmYAr0dflmaS1iSJB4D3DES
	P0F3wFrDsfzWAE9cKQnLQcVVN7iz1p1NltlmDw4u/FakaV4LQaAKfh/d9DZbDTNCb6CYanV/fYO
	GU0XR6NADqSu7TBfiYil5oCD732e+CGghBbRzQ2rW9JdXKvnSRkADebaFoDIoUZgCQcC/scjlvm
	yNwb2EjGDoJIgJOZKKVdXnPhHh6ANAczDoVedcWLrpSJxqrzJzqiJEDvw0W71uqnu22vPITwYmK
	OUfdk2OTdTB/FFX6vBESSr6msjorBXRGDqOLgP1SIndPWzcbu0yiFuqKqhVPEekN4DizpoRQuVd
	+ZwnVM6wzSCpnGKpJ8I5+XzxJ1jWw4MyjTCXZuBPwNU8Tttgcic1H/OVxn44n9UED7lREHDEIJZ
	655+GPfItzQ==
X-Received: by 2002:a05:6000:490c:b0:4a7:7bec:e159 with SMTP id ffacd0b85a97d-4a77bece556mr855808f8f.15.1794986827761;
        Tue, 17 Nov 2026 23:27:07 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656095f21sm2901099f8f.38.2026.11.17.23.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:27:07 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 18 Nov 2026 11:26:40 +0400
Subject: [PATCH v2 2/4] usb: typec: tcpm: Stop replaying
 Source_Capabilities after cable discovery
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-tcpm-soft-reset-sop-v2-2-b6decdc95e66@flipper.net>
References: <20261118-tcpm-soft-reset-sop-v2-0-b6decdc95e66@flipper.net>
In-Reply-To: <20261118-tcpm-soft-reset-sop-v2-0-b6decdc95e66@flipper.net>
To: Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 RD Babiera <rdbabiera@google.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-usb@vger.kernel.org, Alexey Charkov <alchark@flipper.net>, 
 stable@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1681; i=alchark@flipper.net;
 h=from:subject:message-id; bh=2Ny84LlQ3zhUCvoplIosLPZF+LUcjGQ3WYkPbhaGJy0=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWT9DXbNE52xdtl1Z/11KjL/cndWy7xRuOQoGfmSV/zfe
 xnV6TIZHRNZGMS4GCzFFFnmfltiO9WIb9YuD4+vMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEz1kypGhg/PLprV1P1Z/eCzyNR0QUX5SWd7lq279D/BgPNXos1lsw2MDEdXPd/
 VlbRO7IuNVs/FyId/d550VzwXHfnVbmpb2i6u+4wA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

When its first Source_Capabilities goes unacknowledged, a source that is
the VCONN source asks the cable plug for its identity in
SRC_VDM_IDENTITY_REQUEST. Entering that state sets upcoming_state to
SRC_SEND_CAPABILITIES, for a message from the sink that interrupts it
through SRC_READY. The ACK and send error paths go to
SRC_SEND_CAPABILITIES directly and leave upcoming_state set, so the
first SRC_READY after the contract sends Source_Capabilities again. The
second negotiation can cut into the sink's own Discover Identity, and
once ended in a Hard Reset between two FUSB302B ports.

Clear upcoming_state when SRC_SEND_CAPABILITIES follows
SRC_VDM_IDENTITY_REQUEST directly.

Fixes: af8b627046bc ("usb: typec: tcpm: add state machine support for SRC_VDM_IDENTITY_REQUEST")
Cc: stable@vger.kernel.org
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/usb/typec/tcpm/tcpm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 8c5be904d772..b9146658f6e5 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -5544,6 +5544,12 @@ static void run_state_machine(struct tcpm_port *port)
 		tcpm_ams_start(port, POWER_NEGOTIATION);
 		break;
 	case SRC_SEND_CAPABILITIES:
+		/*
+		 * Straight from Discover Identity to the cable plug, rather
+		 * than back through SRC_READY after a message from the sink
+		 */
+		if (port->prev_state == SRC_VDM_IDENTITY_REQUEST)
+			port->upcoming_state = INVALID_STATE;
 		port->caps_count++;
 		if (port->caps_count > PD_N_CAPS_COUNT) {
 			tcpm_set_state(port, SRC_READY, 0);

-- 
2.56.0

