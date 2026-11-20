Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.243.164.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795148785;
	b=qQ++9di5xKU+As4QPl1dp+87JMvZXclG8PZEqwWNKmsyMUv9336Y6rru3dn0Qgf+W/JZ
	 SyC0EJbWtQJNwaMlf5yeoskQtngEVT7loFC8hFyiNWu2hISkH7kRIfJGloGYjgytJIwbj
	 +v9AF6qYOP4uNSs2kb3RN26JljWs2yYYfvS2HvxOmuwIGv3YaNnWiCZuWAMDJ1IBp9gcp
	 AGLlH+pIqOrYT3y+nBZ8hgaCy1bW+wZXVzlqLYUOHojAXPJnWIrPP/cNPB+5rcIy9rT1+
	 lFxTo8mEbRGG5Cgd7N+Cvs8JQNPgFlo2NZSVj3pR7YkIDEAwsqqcBzukJubRx3ngCbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795148785;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=rwA4cmylgtTjmwUEihohLksjXykV4RZL1TIahTXxhWs=;
	b=lxK1m1SgWq2CBWnuimvImp5jsbXThjtuCNyZHbn4Tvw3LLZWEFW9+VLWIOvwb2GsjhNl
	 7e3orBjDT+fFHJrEnaxdx9qcaIMjm5oD/WWQwPl3M1kseo2pxvI8wFD+b0KsTPac8sbTY
	 khUu5SJ4DXJWFvDKkWUZSsDi1YAgqzA11ausMFgmMDnU7MlwXPx1CPXIp29Qp5A8CglCp
	 oUfwZ9whaRlPhll8lTV4agJFxGcxBxkxQeegSlk2SrMB7W9nGTuk7bXogZo1AawY1lauf
	 pwFRIFIh2NyurQuUttnhXSRAokHLiDuYePuhCVP+A1afXCPqQuIESxsL9mEZA+aY1AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=stu.xidian.edu.cn;
	spf=pass smtp.mailfrom=stu.xidian.edu.cn;
	arc=none smtp.remote-ip=162.243.164.118
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7138606A320
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 04:26:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7138606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=stu.xidian.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stu.xidian.edu.cn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.xidian.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-Id:MIME-Version:Content-Transfer-Encoding; bh=rwA4cmylgt
	TjmwUEihohLksjXykV4RZL1TIahTXxhWs=; b=Zs7nhYmYwnJMx14+W7L9IYXBUN
	4lgeZh+Xg/r1APACg/r2nDe9wNd1O8NZoebWsT4R5iLMefqfZWl5y+u5u3Z37paH
	Cp8uI4wqPnKXoaZalb20y5vTlSkMD+IqTnUON4UPaOTRWR4Fuax5jxxs5rxqlnwT
	9FASXYdjhz54pVrEs=
Received: from LAPTOP-FRMFRHCN.localdomain (unknown [2408:8670:ae1:0:bbb2:6215:5dc7:c1f8])
	by hzbj-edu-front-3.icoremail.net (Coremail) with UTF8SMTPA id BbQMCkBGTwLhy_9qWF7sAQ--.30933S2;
	Fri, 20 Nov 2026 12:26:10 +0800 (CST)
From: Haoli Zhang <26031212468@stu.xidian.edu.cn>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	Haoli Zhang <26031212468@stu.xidian.edu.cn>
Subject: [PATCH] usb: gadget: f_midi2: disable endpoints before freeing descriptors
Date: Fri, 20 Nov 2026 12:26:07 +0800
Message-Id: <20261120042607.1347854-1-26031212468@stu.xidian.edu.cn>
X-Mailer: git-send-email 2.34.1
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
X-CM-TRANSID:BbQMCkBGTwLhy_9qWF7sAQ--.30933S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw4fKF15uF15Wr45uw43GFg_yoW8tw4kpr
	ZrGrWjkFWDta4q93WrGr4Fvw15Ca9Yva45trWUK34avan8t34ktr1ftFn0gFn8CFyxZw42
	qFZxtr1Duw4rCr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvq14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
	6r4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
	FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr
	0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8v
	x2IErcIFxwCY02Avz4vE824l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0x
	ZFpf9x0JUcYFZUUUUU=
X-CM-SenderInfo: yswqjiasrskluy6v33wo0lvxldqovvfxof0/1tbiAgUDEWr-E0mS0wAAsb

The dummy_hcd driver keeps a pointer to an endpoint descriptor while the
endpoint is enabled, and its timer dereferences that pointer in
find_endpoint(). However, f_midi2_unbind() frees the function descriptors,
while f_midi2_disable() currently only resets operation_mode. When the
function is removed, an endpoint can therefore remain enabled while its
descriptor storage is released.

Disable the MIDI 1.0 endpoints and all MIDI 2.0 endpoints from
f_midi2_disable() before the unbind callback releases the descriptors.
Keep f_midi2_stop_eps() unchanged so altsetting transitions retain their
existing request cleanup behavior.

Reported-by: syzbot+599d4e8994a656eafe15@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=599d4e8994a656eafe15
Co-developed-by: Jinning Zhang <25031212117@stu.xidian.edu.cn>
Signed-off-by: Jinning Zhang <25031212117@stu.xidian.edu.cn>
Co-developed-by: Bin Yu <byu@xidian.edu.cn>
Signed-off-by: Bin Yu <byu@xidian.edu.cn>
Signed-off-by: Haoli Zhang <26031212468@stu.xidian.edu.cn>
---
 drivers/usb/gadget/function/f_midi2.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/usb/gadget/function/f_midi2.c b/drivers/usb/gadget/function/f_midi2.c
--- a/drivers/usb/gadget/function/f_midi2.c
+++ b/drivers/usb/gadget/function/f_midi2.c
@@ -1167,6 +1167,13 @@
 	f_midi2_free_ep_reqs(ep_out);
 }

+/* Disable an EP before its descriptors are released. */
+static void f_midi2_disable_ep(struct f_midi2_usb_ep *usb_ep)
+{
+	if (usb_ep->usb_ep)
+		usb_ep_disable(usb_ep->usb_ep);
+}
+
 /* start/queue both IN and OUT EPs */
 static int f_midi2_start_eps(struct f_midi2_usb_ep *ep_in,
 			     struct f_midi2_usb_ep *ep_out,
@@ -1343,8 +1350,17 @@
 static void f_midi2_disable(struct usb_function *fn)
 {
 	struct f_midi2 *midi2 = func_to_midi2(fn);
+	struct f_midi2_ep *ep;
+	int i;

 	midi2->operation_mode = MIDI_OP_MODE_UNSET;
+	f_midi2_disable_ep(&midi2->midi1_ep_in);
+	f_midi2_disable_ep(&midi2->midi1_ep_out);
+	for (i = 0; i < midi2->num_eps; i++) {
+		ep = &midi2->midi2_eps[i];
+		f_midi2_disable_ep(&ep->ep_in);
+		f_midi2_disable_ep(&ep->ep_out);
+	}
 }

 /*
-- 
2.43.0

