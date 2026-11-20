Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.243.164.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795166513;
	b=xJRsCA2U9/DrQG1VDTnxFBHB45pQPKRt6o3o3apfPbKJOa5AYdRJxa8uC+03O+N4GTCk
	 04IyDJ9K+gHc4DDbstJ4d47sYDYz8v/t34z30XTAdmIm1fn/evLLfbCecIh2oBqOF3OJU
	 W8e/MBOXH/2IpiSBPIhtsqSrFrMsgbhsouGnRb0sfcUS0RsKbEASmGxhlmgoElttBMmbp
	 2vlA1+Fka77Engv6Gq850j2do1J24+rPrt/u7QRyMa7ZWuncZdl4oqqcKGcz8A97//Ty0
	 WN9XUjLMonVusJd26PUwL7S/k/ddvyVFMUh0oRewJfibBDHotEmvpkLbbVd1MPVv3Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795166513;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=C3p2qAYM3kIBhwefoYmsJvsmhyy0ez/in4GBowOXtQo=;
	b=INbjm1XTzj0DU+tS+JpR1EL723fzgqyZNTmCOsdEVmRukwuI1IhTZJ6keeH/2brRr9Yh
	 SO53Fm8IcWwsPxMSXy6R3xeRQNgldvWe5+C1V0iYpQ9TgMHvwq2xvF1RsQzrKVjuo54Sx
	 fIcgONuwtWOkFJttvA/RBqfo2N44qpuLoJmWhZFa5ZPhc4czLijuKFzWNqfsbF2sFGv5V
	 mp/RoCciHCh3DdX0g2W2hxHk6OQp2luD1oGGAKjqIBpym9Bln5Esxb26OxotvvtnD9pvG
	 owbL7m6/NPmaGSOBBCRJTpId9D93QG7ZS3Km08U+2aopeIjIgsHklr8JeUuFCwZP3gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=stu.xidian.edu.cn;
	spf=pass smtp.mailfrom=stu.xidian.edu.cn;
	arc=none smtp.remote-ip=162.243.164.118
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 818FB606A325
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 09:21:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 818FB606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=stu.xidian.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stu.xidian.edu.cn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.xidian.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-Id:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=C3p2qAYM3kIBhwefoYmsJvsmhyy0ez/in4
	GBowOXtQo=; b=33XuCaHTQBoPKveZiLmolKP962TYS8xU97wa9ZoroK63fwYqVE
	PUkaqjsR+JSHOXk06ewEdxSMqDWY4StUgjOH4kOxYNPIsIFGa+C4/4EXLHS/y+i5
	7+GtsDhJGGps6e6IieugO4gdlWbbQ436yLtxmyNHagJl2i1J+6n62WzdM=
Received: from LAPTOP-FRMFRHCN.localdomain (unknown [2408:8670:ae1:0:bbb2:6215:5dc7:c1f8])
	by hzbj-edu-front-4.icoremail.net (Coremail) with UTF8SMTPA id BrQMCkBmiwEcEQBrEmzvAQ--.35043S2;
	Fri, 20 Nov 2026 17:21:33 +0800 (CST)
From: Haoli Zhang <26031212468@stu.xidian.edu.cn>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	Jinning Zhang <25031212117@stu.xidian.edu.cn>,
	Bin Yu <byu@xidian.edu.cn>,
	syzbot+599d4e8994a656eafe15@syzkaller.appspotmail.com
Subject: [PATCH v2] usb: gadget: f_midi2: disable endpoints before freeing descriptors
Date: Fri, 20 Nov 2026 17:21:29 +0800
Message-Id: <20261120092129.1388279-1-26031212468@stu.xidian.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261120042607.1347854-1-26031212468@stu.xidian.edu.cn>
References: <20261120042607.1347854-1-26031212468@stu.xidian.edu.cn>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:BrQMCkBmiwEcEQBrEmzvAQ--.35043S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zw4UCry8WryxZryDAFy5Jwb_yoW8tFW8pF
	WfJrWjyFs8JF4qka1fGr40vry5Aa90va45GrWUK34Ivan5t34ktr18tF1YgFn8CF1xZw42
	qFsxJw4Duw1rCr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9l14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
	FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr
	0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8v
	x2IErcIFxwCY1x0262kKe7AKxVWUAVWUtwCY02Avz4vE824l42xK82IYc2Ij64vIr41l4I
	8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
	xVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
	AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8I
	cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
	4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU1F4iDUUUU
X-CM-SenderInfo: yswqjiasrskluy6v33wo0lvxldqovvfxof0/1tbiAQUDEWr-ENjRwgAAsY

The dummy_hcd driver keeps pointers to endpoint descriptors while endpoints
are enabled. Its timer dereferences these pointers in find_endpoint().
However, f_midi2_unbind() frees the function descriptors, while
f_midi2_disable() currently only resets operation_mode. Disable the
endpoints before the unbind callback releases their descriptors.

Disable the MIDI 1.0 endpoints and all MIDI 2.0 endpoints from
f_midi2_disable(). Check each endpoint pointer because the configured
direction can leave an endpoint unallocated. Keep f_midi2_stop_eps()
unchanged so altsetting transitions retain their existing request cleanup
behavior.

Fixes: 8b645922b223 ("usb: gadget: Add support for USB MIDI 2.0 function driver")
Reported-by: syzbot+599d4e8994a656eafe15@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=599d4e8994a656eafe15
Co-developed-by: Jinning Zhang <25031212117@stu.xidian.edu.cn>
Signed-off-by: Jinning Zhang <25031212117@stu.xidian.edu.cn>
Co-developed-by: Bin Yu <byu@xidian.edu.cn>
Signed-off-by: Bin Yu <byu@xidian.edu.cn>
Signed-off-by: Haoli Zhang <26031212468@stu.xidian.edu.cn>
---
v2:
- Open-code the endpoint disable calls in f_midi2_disable() as requested by
  Greg.
- Add both co-developers to the Cc list.

 drivers/usb/gadget/function/f_midi2.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/usb/gadget/function/f_midi2.c b/drivers/usb/gadget/function/f_midi2.c
--- a/drivers/usb/gadget/function/f_midi2.c
+++ b/drivers/usb/gadget/function/f_midi2.c
@@ -1343,8 +1343,23 @@
 static void f_midi2_disable(struct usb_function *fn)
 {
 	struct f_midi2 *midi2 = func_to_midi2(fn);
+	struct f_midi2_ep *ep;
+	int i;
 
 	midi2->operation_mode = MIDI_OP_MODE_UNSET;
+
+	if (midi2->midi1_ep_in.usb_ep)
+		usb_ep_disable(midi2->midi1_ep_in.usb_ep);
+	if (midi2->midi1_ep_out.usb_ep)
+		usb_ep_disable(midi2->midi1_ep_out.usb_ep);
+
+	for (i = 0; i < midi2->num_eps; i++) {
+		ep = &midi2->midi2_eps[i];
+		if (ep->ep_in.usb_ep)
+			usb_ep_disable(ep->ep_in.usb_ep);
+		if (ep->ep_out.usb_ep)
+			usb_ep_disable(ep->ep_out.usb_ep);
+	}
 }
 
 /*
-- 
2.43.0

