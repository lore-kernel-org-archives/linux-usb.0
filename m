Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795195734;
	b=gZ/QVmUtY0eLk58leorqzoyxbhWnxxt4jU8Cp0xCPQohKw7DI7JtFNGFI3dyajIjQvZh
	 ENdsl4NjVFt+s0BBXVRja8J4NDD7EzqS+0PWWsZBoZ4ggb2jdXdX30HB0qfsuy9rJpEQE
	 In5+rDqNwiLgkcvRrsDy0avrL3jr8uI/5I4qQPH9nIurbHh21blBcWHcCICyxAxSXydfF
	 xwKD3ZrDjbO2XOfFZvlPz8P29cuazrc0ZRks6rypQP29rcmT199PzgvdlDRNDa5AI63WX
	 ezPmDvxyAQ2MDWErl2qk6seTb+pp05z7UmS+un73Z9KxKItU1up1kj/pC/aRcZglqBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195734;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EyBa1qYdQn+iPfoA42hZVookOq748rCRVECzEXuJvRc=;
	b=kOzm7lV7ZyjarPDZMo3Hy8Uru7xolbjXucrORoVLLylrwsiMvlQ0RKEZlgUyfl8lDaZL
	 VcgG5SVQidBj49qFHBoR+f0WfBBKPQCP8pFtOYEnUr94dUQG5Qo82uodzHnG44DfPh8js
	 jQh77xmzv4vngylw7SvpEKYVksHKdjae87CyvtFG1yqTAnetexphu/VV3ZvEal4CE1pva
	 ZmZX5p+n1YLc8BWXmr7nW8wzv0g3XckGDKLRNMws9xQoCow5r90Gm9RIcEApBV2hZik8z
	 ddrSa7JR4ByyxmDgK5PPJ1y39ZM6ulG9fe3yxn9hPja7Ngye8A3GlPRcr+5ffJp51Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=PnWs1XMU;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A200160A2637
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 17:28:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A200160A2637
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=PnWs1XMU
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-886e61fa30fso515205b3a.1
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 09:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795195733; x=1795800533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EyBa1qYdQn+iPfoA42hZVookOq748rCRVECzEXuJvRc=;
        b=PnWs1XMUfFDo4imkIzgO8Eef7daylampggE8X/caLT6qMzzb+/AYGi622TouMxSUfR
         Gb1oWHjIfXh4u7XfYODyeg41vf9ftHkikVM0ahGw7dFpihIXTd41GfswSRLFX+j1fW7b
         +XPmawmrK+Z4dMy6+AT9GRfHKYLKy/hzjkoFX/Xyr+BpG1x5xiP+SaBiPgmjCjmMLvc5
         Fp5goRuXmLstA65pUmlIhNvY1+vwHlKazsL0USxufxNhwWQhCW2sDMgKu1HJjVzzRrSG
         +fgEzKNQFUIqKr/KKxva+WLOCRykO1LE7Z+30ssryEXEe9ATzYcKoxL2p3Z0Ox+ut4Gd
         jXDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795195733; x=1795800533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EyBa1qYdQn+iPfoA42hZVookOq748rCRVECzEXuJvRc=;
        b=dyREQq7C0T9NNq9TV/+6ofE18of4mKom/uLPBgpgt/id3ytH3AcwOurEQVD+iuIllh
         EWR74qcV2KaWu0u4LJUXl3mhnA2sk3BHebb6BgCtE+cIYeU0I1bg6HdAR7PqR5IhUeGa
         YMJgudlX7xTj7cUZJFleO2FgulhUe1ohJls96XNfvnx29YiKHswwb+j/gciFdwY4Tvyo
         vJu4Q4UyiZLddPuGyyB6id9TV0wQIlHaZOCbaiQjRjw8/vETpAuG+zCv8fxIwyqY14Hh
         y5ceHmOT5Y2RUyK7BjzRow+eZ3/Yh16Ytdo4u7vrSv6QpXAlBDgEVAtA9uUzVhxdjJ6G
         +x5A==
X-Forwarded-Encrypted: i=1; AL+hErE7+HZ0+UYMSxe2WRq5OX0Rdhp6fpJQEAnaEi3DN7eN8W9HzrLt0a3MJZeqg8M4hWDGACrX5fmGqf4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7XVFdhpr6SLl0Edo2WtacAm0w8HukxB11Wd6wrhkDqXvglWLr
	0g+Y6eJcKh6wpD24x4f4APwsPXPmhwGImtsS4slj9KRiFMQtFNzCpP8k4CB4o8NCCKs=
X-Gm-Gg: AZFdTZfyoPJ7qUgN89TuckMwdPP1p9codxazgWue9shxhGv99DF1vvMjICkeUs7ZU/D
	tk3nkpau0GeFiVzdc7vpvpirSGno1TnJEayLjALdBoPf26G8Vg6VdJyBxtCVxAwSjk8o7DkCG83
	OMlBQArY8CdPT8U9DI7S9vx0YJ+kmavB7JC8SjDljwWPYsT2wJo8qDIa5vRwU+xpPky25+yBPPc
	RF1+8dGSlTACXu8P2LE0nR04xNTzCSi6HfUlcyVqRvsIKEAGfhkQ4aQEmQcr9iWTKDSlFjU2GZf
	Wj7e06fPC4TalnAFzubvgw5wkVFMhJEFfDuKSzTt1mnrgfjDeDT22SGNqrL9JALlRjOH6CZLhaC
	ko/mOgsER+rjkKBStfA7osB9O1FbUrlc9/3mY24G+B239T62SKOl1p4ZayCYh4xKwdWb4lex/uZ
	gOtuL6/jtu1hn/sCI3iQ6hL20Y3aZHGAoWEHgLdfRtJSp3mo/vbCKeir3U/B698j148GJkRilzC
	25EjDjc6UbxK910Uh5gFtedQUBNaz8wa/5D7CsvI6ZQe5bxsiyP+CFXrV85Hf4WWnxEi3mn4nNy
	HRuwHPH5e4N0lc52yPWD/RNvn8+k+LaagDlHgxPPcfx7HwES/zh46e6PiUUibxtpiVUPTit6UUr
	o0L/FTj+EB2SQDwto3+nqB9LMxDN3aV80XQyM
X-Received: by 2002:a05:6a00:3c84:b0:8b6:4eec:f501 with SMTP id d2e1a72fcca58-8c87bac51a0mr3657544b3a.14.1795195732839;
        Fri, 20 Nov 2026 09:28:52 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87334890csm1867911b3a.33.2026.11.20.09.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 09:28:52 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org,
	nkapron@google.com,
	linux-usb@vger.kernel.org
Cc: Thinh.Nguyen@synopsys.com,
	bigeasy@linutronix.de,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	benquike@gmail.com
Subject: [PATCH v9 3/3] usb: gadget: f_tcm: clear the scatter list when reusing the BOT status request
Date: Sat, 21 Nov 2026 02:28:29 +0900
Message-ID: <20261120172829.3286180-4-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120172829.3286180-1-yhlee@isslab.korea.ac.kr>
References: <20261120172829.3286180-1-yhlee@isslab.korea.ac.kr>
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

bot_send_bad_status() reuses fu->bot_req_in/bot_req_out to send the CSW or
drain the data phase, but a preceding sg command left req->sg and
req->num_sgs pointing at that command's t_data_sg - set in
bot_send_read_response() for a read, or usbg_prepare_w_request() for a
write.  That command is freed before the status request runs, so on an
sg-capable UDC the status request is handed to the controller with a freed
scatter list: the controller reads freed memory out to the host on an IN
endpoint, or writes host data into it on an OUT endpoint.

Clear req->num_sgs and req->sg so the UDC uses the linear req->buf instead.

Fixes: c52661d60f63 ("usb-gadget: Initial merge of target module for UASP + BOT")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
v9: move the test note out of the changelog (Greg).

dummy_hcd does not do sg, so this was tested with a small module standing
in for the controller's queue path, dereferencing req->sg the way an
sg-capable UDC would.  It reports a KASAN slab-use-after-free on the freed
entry for a read command followed by a rejected command that reuses
bot_req_in, 20 runs out of 20 without this patch and 0 out of 20 with it.
A normal sg read still queues its own scatter list.

 drivers/usb/gadget/function/f_tcm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/function/f_tcm.c
index a8fdb24f9d94e5..b21db34fe2a7ac 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -140,6 +140,9 @@ static void bot_send_bad_status(struct usbg_cmd *cmd)
 		req->complete = bot_err_compl;
 		req->context = cmd;
 		req->buf = fu->cmd[0].buf;
+		/* the status request is reused; drop the previous command's sg list */
+		req->num_sgs = 0;
+		req->sg = NULL;
 		usb_ep_queue(ep, req, GFP_ATOMIC);
 	} else {
 		bot_enqueue_sense_code(fu, cmd);
-- 
2.43.0

