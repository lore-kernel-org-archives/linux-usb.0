Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174804;
	b=iHBZRODc+2YqjdlPeoscwSq5daoB8uyG8gU9IGoh/E9sjkfCvIMZffKHBiwOairZMTNC
	 xRhmPd0L055kcSgudm88UXwNRPmB5xmFYosbBsNtDm2gRonaScTd2vjL2f+X8Vi7J5FRt
	 QsUOHJTxMYmshHeJ15Vw0Dyh8VamHGbKGkisImKrtuD+/cVl06xRUL9nFUQOkiHceQwHS
	 xytOQLN2YLFhg5hhjBQzNukxKSxqf8FkbkvHMYAlmaQtrq/OBViioOSlv2/gBbE1vskoo
	 AAMAmJQ3CS9Ykz6ISBVeKLbYxkVgm0WHfKmPQY8WRbRufjOkqS/AC5ChCyHWalBkKJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174804;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cw32rxb0JMiO3biaJ21jKGN1UmuLPVsWaNPJJq3nW20=;
	b=Z8lCWnEmJpOLLnxfDhli0jhrkGLca959S/TamWrEH8EJ/EoR4An0DZhoHzFlwhHGu+rc
	 Q9UFM2Ive7trBlHJ4pWXr0FYNtTVWRw+ywtGcRw//hGb4IJDzMvv2E2CClNs8uf7WZIj4
	 TdUvOhrV8Pbip3bvxwW+p75iAHhQUVohMVG7z3wsD50vXb4rvrjCY8hb5D2ytwSsC48uI
	 i3tbk8KR/UT7Y93P4W0SMOBbry+pPosU7/WnRQb3pPYtSI8DHQUR8dyaYtwMygLO9ZgSF
	 /ON04IjLwDuY6/wtr9FWKKIfWH9hw6fEYS3KG1wvRLSInpS84PP/Q2DHlcSv9LM6y2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=lUlAVEGt;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AAB606A32A
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 11:40:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9AAB606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=lUlAVEGt
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b439e37813so6921a91.3
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 03:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795174803; x=1795779603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cw32rxb0JMiO3biaJ21jKGN1UmuLPVsWaNPJJq3nW20=;
        b=lUlAVEGtCzgQoqRaac1b9s6fKHZs3qxeQ9EPPmSA8N9uuHg0iwfUQsKNtKz1c1OLE5
         whOj1BCqqbGngi+8dwLzQ/0+MDnBzsiDBsSn6tQHvk46/J95vSB8A3m5Ylsr31WFry4u
         PKkRVhGqemZNfNRHKuZFQMve81yAhNW6lzGCYIPRjobnJ55776QfXwTAf8L+dj4ryOIT
         mT4oBNfqrbYORbQ6I9SLlP6lzmcIXSrvyiMAhixboxEuviYVNvp3hhnhpx/v0iswyj6Y
         2nFXe+Bf4t0T72YtcRygi23Lbnqx1bY1beSmZUOoE6Ikf2v0e4MNoZjEpEBhataizVsk
         zxlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174803; x=1795779603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cw32rxb0JMiO3biaJ21jKGN1UmuLPVsWaNPJJq3nW20=;
        b=t+7Q/tMoKeuh1GtuIaqwC+E+L/SII6nKuG2rMRsP7FwOfr+sD/DN+Z6z6G8uGXKnIp
         Cx/Ji3UJ53Mcd8hTvGH/rYarHuabt+zfPSx+SboWv+DzghYQGiW4SX0irCZH8nlhGBJn
         8TJzK7YR8Qir/2y0mygggjfSF13KdnPakyJtOCgLbheqxn2T+e/KdcPeXfxSe4r0542Q
         eyjexZzmqzsxGSjbpLH3vivxSFMVbHYADQM9z0TSehGMeEpOA8Ez+EThOzh5lSXKooM7
         OmOqZcW/hd9ZYmIY+ESbvs1+q6Hurcp3nbQOqCHkx5sSpX+a3tEdJb/B/jeif6Erjywe
         FoTg==
X-Forwarded-Encrypted: i=1; AL+hErE/P3mN6kNX4PDZyn40Cv1gN5xTBZ1SOOHq1/Eyf8DCvuTbAm/e230vj/bLBARMAFC4cqBW98AYgiw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GXJPcZMwsxVc4jlmTegQ+KsBI35CLL6aacB6ytkhC0310CmfP
	ql1us0J7B29ZHyPTN9/CFtEdnH4PIfAWe0fuvjZkERJvbZWuDwll+NXNCLZZu7VIgP4=
X-Gm-Gg: AZFdTZfnnQ57mdQ260201rTA3KcydmmnfCZDkGD0+XhXikBXK/8pBmP8w1Cmqfquq9x
	Nd3KNi8k5XNIl5NahvKx5aAT1qwjS0+CiGVNisPOKEQuno6FhKYF2r0DQuSmVwi0rsgU9H5HfmU
	JLKUtJNOXEjkS7QGsGum5ro5ZEUbOSjekTB57CZDRDPpxUF6xyR6uTOsRSs3PsnFRJmyS6r2vGK
	0Fe4fny5ngRyZ1OkrOGAn2DylQkCf/EZIRkj2TdWb5erORa6bUWpSwveeMQnX6xurcWebZyNrPK
	UHJ1osBZgdRIzUa6YE1h+cE88SmeHB7LHkkoCqnq0jWOIHEgC43JUEzhBy4fZ9/a5cc1rxn6YDh
	G9JxcU2Lq5LITssbvqtIkspgVb2mo6Z/l5stZ0PeZKC/b6g+jeXxIDb625mJ6psf4c48o9P//QK
	MSszmPZShwuWVAHSMCQ01O2UH2TyXlOZBaMWqh8gxjmY0sqNfkgXwKsDQXU265xHdELf/bxJeVX
	ow8xjp1+CpEHuixUL34iZk3pp3tN3XcHBVQ8CVR5YK1In0zR1Y39ozvGWVVSWTQ+4JnTeDt1T7Q
	fwww5v5A4K1n1YNpnbJCwOi2gT2PLqPzRInqdcNH591E+xzyggWK7/Dh/xUhw1UvRvvpc+Yla+h
	Zc4Nxw3IdZx7GwCDHgQBj+LQSIAJgoMJkL9X6
X-Received: by 2002:a17:90b:3fc7:b0:3ac:7874:639e with SMTP id 98e67ed59e1d1-3b41caf5efamr2323448a91.46.1795174802943;
        Fri, 20 Nov 2026 03:40:02 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cea748csm1173293a12.4.2026.11.20.03.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:40:02 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org,
	nkapron@google.com,
	linux-usb@vger.kernel.org
Cc: Thinh.Nguyen@synopsys.com,
	bigeasy@linutronix.de,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lgs201920130244@gmail.com
Subject: [PATCH] usb: gadget: f_tcm: do not dequeue UAS stream requests in BOT mode
Date: Fri, 20 Nov 2026 20:39:56 +0900
Message-ID: <20261120113956.3071640-1-yhlee@isslab.korea.ac.kr>
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

usbg_aborted_task() starts by reading stream->req_out->status.  The
stream requests are allocated by uasp_alloc_stream_res() for the UAS
alternate setting only, so in BOT mode they are NULL.

The target core calls .aborted_task() from target_handle_abort() for an
aborted command whose CMD_T_TAS is clear.  A BOT command gets there when
a LUN RESET arrives on another fabric that exports the same backstore
and the backstore has emulate_tas set to 0: core_tmr_drain_state_list()
aborts every command on the device, no TASK ABORTED status is owed, and
the core calls .aborted_task(), where the read faults.  With the default
emulate_tas of 1 the core sends TASK ABORTED status instead.

Return early unless the function is in UAS mode.  A BOT transfer uses
fu->bot_req_in and fu->bot_req_out, not the stream requests.

Reproduced on dummy_hcd in BOT mode with a fileio backstore that is also
exported through tcm_loop and has emulate_tas set to 0: a WRITE(10) has
its data stage held while SG_SCSI_RESET_DEVICE on the loopback disk
issues the LUN RESET.  Without this patch 3 of 3 boots oops as below;
with it none do, and the write does not reach the backing store.

  BUG: kernel NULL pointer dereference, address: 000000000000005c
  #PF: supervisor read access in kernel mode
  #PF: error_code(0x0000) - not-present page
  PGD 0 P4D 0
  Oops: Oops: 0000 [#1] SMP NOPTI
  CPU: 1 UID: 0 PID: 30 Comm: kworker/1:1 Not tainted 7.4.0-rc3-FT9NNM-00395-g8dac6df92a2e #1 PREEMPT(lazy)
  Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
  Workqueue: target_completion target_abort_work
  RIP: 0010:usbg_aborted_task+0x2d/0xc0
  Code: fa 55 53 48 8b 87 e0 01 00 00 48 89 fb 48 8b 50 38 48 8b 52 30 48 8b 2a 8b 57 24 48 8d 14 d2 48 8d 14 d0 48 8b b2 58 03 00 00 <83> 7e 5c 8d 74 2b 48 8b b2 50 03 00 00 83 7e 5c 8d 74 58 48 8b b2
  RSP: 0018:ffffc90000107e40 EFLAGS: 00010246
  RAX: ffff88800540d000 RBX: ffff888006c6c870 RCX: 0000000000000001
  RDX: ffff88800540d6c0 RSI: 0000000000000000 RDI: ffff888006c6c870
  RBP: ffff8880053febc8 R08: 8080808080808080 R09: ffff88800491c218
  R10: ffff888005031cc0 R11: fefefefefefefeff R12: ffff88807db295c0
  R13: ffff888006c6c9a8 R14: ffff888005031805 R15: 0000000000000000
  FS:  0000000000000000(0000) GS:ffff8880f9e92000(0000) knlGS:0000000000000000
  CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
  CR2: 000000000000005c CR3: 0000000003030002 CR4: 0000000000770ef0
  PKRU: 55555554
  Call Trace:
   <TASK>
   target_handle_abort+0x6b/0x130
   process_one_work+0x19e/0x3f0
   worker_thread+0x180/0x2f0
   ? __pfx_worker_thread+0x10/0x10
   kthread+0xee/0x120
   ? __pfx_kthread+0x10/0x10
   ret_from_fork+0x186/0x230
   ? __pfx_kthread+0x10/0x10
   ret_from_fork_asm+0x1a/0x30
   </TASK>
  Modules linked in:
  CR2: 000000000000005c
  ---[ end trace 0000000000000000 ]---
  note: kworker/1:1[30] exited with irqs disabled

Fixes: 76003eb6d09278 ("usb: gadget: f_tcm: Handle abort command")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/usb/gadget/function/f_tcm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/function/f_tcm.c
index 9e6d4f39900a27..57e2ec81f29a8a 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -1614,6 +1614,10 @@ static void usbg_aborted_task(struct se_cmd *se_cmd)
 	struct uas_stream *stream = &fu->stream[se_cmd->map_tag];
 	int ret = 0;
 
+	/* the stream requests exist only in UAS mode */
+	if (!(fu->flags & USBG_IS_UAS))
+		return;
+
 	if (stream->req_out->status == -EINPROGRESS)
 		ret = usb_ep_dequeue(fu->ep_out, stream->req_out);
 	else if (stream->req_in->status == -EINPROGRESS)
-- 
2.43.0

