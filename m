Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795097211;
	b=15Etr5Nxhk3L7SErufqKTclrcvkcc2Er43X3L+trXjPLY2EVREbXlJze6TsEPX+m3KxL
	 cy987o3gkNbtqqjZJ7H4dI7Ab2amQ52ktSgI08t+RogKYpa+JYORegXFFWWYJJMZEC5Cr
	 FY0F+ccCeUO+4k5Tv/+lQJgfCg2/r55TWQVmT+DMi55DJnfGiosJb1MVRL6paxyF9z7mC
	 x2lj9wKvd0AwrmD7aqGdm/AY7lPQqIi7fo0DHmfmScAphBK0AWg7XQKdKm0lZv4QAurCI
	 xsPbzeCPziknVX/A3iALCB73PbZcDXWd2cRjo/MJg0V1BI5PF2hMCY5tEblwVUYzM/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795097211;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fKe6Wwe+uM8ct2ILYG9GC0z59MDxTFu3ZRvOh8CsW+s=;
	b=N70GVEaHZmxQGAYrVJhkvIYyGLbWtGtTN21J0VJApN4uw/oORxJKZ3+PIGFZAnWqoySh
	 lzgl//wiPEXCkD/gewAGIVkN+GOV0kC6oTNp3e3Mt2S+z1EKF1RIaoD2jad7AqpbqBprL
	 znAeqBTEkUtG+XTTg36UVMRXR4g5QceO3JVSMKexqs7CZhOE/WjUBoi9tgglYwYCqZ5Ao
	 jpsNFcX9dhTTe746RCsIZvHe+oailVrzU9hRCXn3zQp0xxPHtfCBIKWpojMl1A3TSSSgL
	 8IlZvCRxae0LSqBcnr3HFzAu0bivb9Yf0//JQsAxKmZEdO7nU40VxBttFawtMBkC8fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qMGi1RB0;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FC5606A32C
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 14:06:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1FC5606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qMGi1RB0
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8b5a6f2f27fso1123062b3a.3
        for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 06:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795097210; x=1795702010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fKe6Wwe+uM8ct2ILYG9GC0z59MDxTFu3ZRvOh8CsW+s=;
        b=qMGi1RB01nCTpeGcD+3NQ8KonAivL3GAgldd75Fc5LllsDJ78EPnPBepVdshc8isQD
         GxyCtBkLhMMfXe7C3p/WEPYBoH/Q6q4JIYQ0hKi0KmIZI55b9tZJCRbxdjkn7yX6Y5ue
         xELcvthzb2Ac9EbY0GOTePQyt7uUJI+U5qE19R7kqhG0TQP7CZZf3emnB0o9gGFMKCof
         OluppgY8UpuQSl78qEYIpYiWqFBxt1p0PQtvAueAoWMtd9gKK9RoFnkD2v05Ipk1JrbY
         pt87+Ej1vdvmWgIli9h1GfqVjit/v7kmR/lwNle5qY2zj8VUW951R9CZxiAXEd6GMhBa
         /QeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795097210; x=1795702010;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fKe6Wwe+uM8ct2ILYG9GC0z59MDxTFu3ZRvOh8CsW+s=;
        b=f5JVAUEsdNTPw5v2/ClOJp5hG1sISpafJRlCENplF735SdmRpAzZu6FSHKVgVqpfdu
         OEzeC9Cf5TxpQfGeDGv87lfGq2+lZvCeOHPJ3WeE2zGgM59coyyc9A4sOLkD0YkwQ26A
         sVyGLpZ42NhGgkeZFouTusJFwE68PSpSWqiF6Fiwk5k7PB6x2BwPvds7FeMF+eW0AIkw
         4DIkptcc/BBPFXu+ct5xZNtducnD74sWQbMAWIxGS47WHcUi33vBRjHE4i6GcwX2dFGd
         btBwveMOAazBCNO2kLiJbf01pcG3o7gZYPOjv0K6+i45WG1fhBeBZmkarkIyMw90u65T
         hvAg==
X-Forwarded-Encrypted: i=1; AL+hErGt+fLQLzFaCB+J/+MYtXrcTqLNTfKuEsGYWDNP0jof+nPycpnwGqCBqmDAY/rBWvUei3eCW15KTMk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7lqOYO2A2RX8pqRXhso9i4wE8lwZ1i9D0YJC06wUbktwhBKnT
	QYP6AksEWuSDDtS5qlmwnWSEkMF1sMx0tGdxBSxi8w+bOWLF8BP5rdfQKMuZqEjz658=
X-Gm-Gg: AYBFou18QT2be+BPWoX5uHZNEWTrmT5ElPqXI4686aJsNeIdLLb1/o1zlJnEeEP0i+L
	XOdSIoHBVElDHL+gQi2HVCQGIshu7F0YTgI2Wr7D2PPQ8xv9GlaNkUKYjebiFxg6L6ZKPObRzIU
	HcAlAK1AN4GhUD4mqhl3Qu4P7lw8YbrDHh8UjovtvOtMD9crOIXIw/n9caViwt/ibgvs2NwiTkD
	hDwq6rW2Z+iX8McR36q4DIfTk+TBwaLDE9Hqo83+FEdcEsJMaJ+fFxGSSGjhxg087IVERNNTwaQ
	PpCm9jfWahOs1Kud8Qxfoil3ZSDm/JxKKoUsJPQYGl/sLttqixVdi3Z1/c5/q/o4ILLndGwc3Il
	/uk93tLmA8qd+4Awd1qo6UG/CPahw9ZslT+T6pJPkmUn7IMopFcSgfLc/NLEDTwC4Rnu5IjWlyN
	wSrUNuawgYednjd12m+Zzm0HI/p0A6h+m7nJOtKVzYoajj3z6NGqUYJoKtWdXM1IaDSvNmahSLj
	XFCrSu9lHMoP3bl/Zg7lIXjl1E3952Dn9MQ3SQkkuwx9Mrj14vlbA+ICQTCaTo8ixhJt6LTcBwW
	tuJN5zcTcOXCVL7a/WJUJuGIZ7ZZozjiMXJ2FliJwDormaqSuzsCj+03W65rIdtbcF58nYVsg/V
	C/rDi4ucycDIkCahBkdRJLddSX7VkGfO9N0dxdw==
X-Received: by 2002:a05:6a20:c90a:b0:3fa:53f1:abf1 with SMTP id adf61e73a8af0-3fe8b6e5b13mr6374216637.66.1795097210065;
        Thu, 19 Nov 2026 06:06:50 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:1076:1f1f:dde8:a816])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5ca7aaadasm2808154b3a.13.2026.11.19.06.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:06:49 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org,
	nkapron@google.com,
	linux-usb@vger.kernel.org
Cc: Thinh.Nguyen@synopsys.com,
	bigeasy@linutronix.de,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lgs201920130244@gmail.com
Subject: [PATCH] usb: gadget: f_tcm: put the overlapped command's request back on ep_cmd
Date: Thu, 19 Nov 2026 23:06:40 +0900
Message-ID: <20261119140641.2768465-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
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

When usbg_cmd_work() confirms an overlapped command tag it returns the
duplicate command's slot to the session tag pool and cancels the active
command's transfer, but it never hands the duplicate's own request back to
ep_cmd.  The two sanity exits just above it pass that request to
usbg_submit_command(), and the status path gives the active command's
request back once its response has been sent, so only this path drops one.

The request is not leaked - it stays in fu->cmd[] until uasp_free_cmdreq()
frees it - but it stops being posted, so the gadget can receive one COMMAND
IU fewer for the rest of the alternate setting.  There are USBG_NUM_CMDS of
them, and a host spends one by sending two COMMAND IUs with the same tag,
so the command endpoint ends up with nothing posted and no command is
received at all.  There is no memory error to catch here, so count the
posted requests instead: on a dummy_hcd gadget in UAS mode the count falls
by one per overlap and reaches 0 after 32, and the gadget then answers none
of four following commands, while with this patch 33 overlaps leave the
count at 33 and all four are answered.  Three fresh boots per arm.

Take the request pointer before the slot goes back to the pool, because
from then on it can belong to a new command, and queue it after the abort
so that nothing else in the path moves.  A queue that fails leaves the
request in fu->cmd[] for uasp_free_cmdreq(), as at the other two sites that
post to ep_cmd after setup.

Fixes: 29ed17053872 ("usb: gadget: f_tcm: Check overlapped command")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/usb/gadget/function/f_tcm.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/function/f_tcm.c
index 9e6d4f39900a27..4dcf2ba0083848 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -1275,6 +1275,7 @@ static void usbg_cmd_work(struct work_struct *work)
 		struct uas_stream *stream = NULL;
 		struct hlist_node *tmp;
 		struct usbg_cmd *active_cmd = NULL;
+		struct usb_request *req;
 
 		se_sess = cmd->fu->tpg->tpg_nexus->tvn_se_sess;
 
@@ -1318,6 +1319,12 @@ static void usbg_cmd_work(struct work_struct *work)
 			return;
 		}
 
+		/*
+		 * Take the request before the slot goes back to the pool; it
+		 * is queued on ep_cmd below.
+		 */
+		req = cmd->req;
+
 		/*
 		 * The command isn't submitted to the target core, so we're safe
 		 * to remove the bitmap index from the session tag pool.
@@ -1333,6 +1340,8 @@ static void usbg_cmd_work(struct work_struct *work)
 		active_cmd->tmr_rsp = RC_OVERLAPPED_TAG;
 		usbg_aborted_task(&active_cmd->se_cmd);
 
+		usb_ep_queue(fu->ep_cmd, req, GFP_ATOMIC);
+
 		/* Send the response after the transfer is aborted. */
 		return;
 	}
-- 
2.43.0

