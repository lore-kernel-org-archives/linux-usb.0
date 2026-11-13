Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794538167;
	b=jNpO3679CiyZzWotLwFmLbsoWAPerNrImiZ7Wrn/xlxPtiSnG26ZW3kKIzGHY5v5hDHz
	 xunn/voWgU21Ydqr16kHmx8twRwTSdltXnhErW06ROxOC9LzwsbF/honc3TKU8Bx4AcTc
	 iVEa0uYF32sXCiTVAYMd6kmSSVncoGhTyGROkjn7sTyQXxeLCZDLhz5XFxPO5IVEZRsMy
	 9H8+RiLaNb5racuR+XcEX14kusAabdnvKR9BI/hRpndxWxu4JiM/7c9MRnoJWI9E5UvBY
	 2Ps/oyE67UspTq87v/PCWPvqGW5ZjyE44tcPYBuVtT/QgXFmCDGpNVwxCn3CfTzi5NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794538167;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=Ea7AxrGlB7THjQmdukSzo51aXDomAu6+9ySrKXHX0Qw=;
	b=y4eV4a7ToAalvfyku06+p1a6isoZ6YKj4qmAOpR4KMSEew1bJodGkT7PYHQxzteEfpg0
	 0Vue572zHxD1yX8zrDS8LcZ8j4rR38Ul58a2BWd5qm1HHTQUU7pPlfu8/TZt088EuhbkC
	 JfWLnug4IAPmR/ViZph8dYa9M8aRqGLuMnVkOjjBd8n7wno52ChDGww7QJ9ZH5CB8vg4z
	 A3xOtsVQaNHMjnoUJFdIvtrLqlHVWIztVWhXmhOV0JpXoLdt8YbxzczYBFsaEmhcgtigc
	 EkRCTDwATCCAqz04Ku4irneAbekOpwGiMKXRgvD3HtppW7vV8rQE1V0sq1he0nqwJXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--sarthakkukreti.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jXuN50+C;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9618B606A31C
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 02:49:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9618B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sarthakkukreti.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jXuN50+C
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36d1353fdcdso2266497eec.0
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 18:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794538166; x=1795142966; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ea7AxrGlB7THjQmdukSzo51aXDomAu6+9ySrKXHX0Qw=;
        b=jXuN50+C855ba25WGA7GSVrXfMxVhkFtQLaazvbUEGmLcdy4Bt0H/mu2g3XehK99l5
         6N88eC+yDLGx076KS8oedkB9G3gNDNtibWw/9GVMvpJ1sxcperHn67rLky4govSaqSmY
         QKLvmrigziC4+QAc1chb4ZMq0D6KP968s2xd86isE95KAYioHC1djE9SVDyOF65aXFf6
         XTCpx9ToMpy6moZa0jv/61YyIRfsJ5LSD2SGlCSow5eWX8iHdFnjjQOHbNVRWRs8yowc
         hHXjn7N3poiIZojQIGVh8MSEFo8aj8P3CCLNkGXWzt0wHLTkCK6KgGDuuBJ0JDM6buX3
         JUxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794538166; x=1795142966;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ea7AxrGlB7THjQmdukSzo51aXDomAu6+9ySrKXHX0Qw=;
        b=I/LFfGLQOJTpljIdmjaf/PR90100lWWsLHlRi0iNDXQTmEGPiViHv2ArBP4TUwyjPv
         BnM0zXACn/e7nr485r+4HeaQZPmGyf10MI+LELYRn9IOHtRSXpIviSsCRJ15FTAeH5i0
         LMwhjsbldOHz6pMsrbcE6lOgy02k2zxTr2vcobHkY1w1OcNRCFNukHIqfngF3weQnwMf
         Kyhf4dGDzV9PypzsfnuiPwK2IM+x0JsIvFWx7OtiMD3UTCDNnq25L14arhQzJxOgRa72
         eWVSeHe5jcX/7N0yuaL4IBhvOnMh+mV0Aek2DUZN06xltL+a1abj8GyQCFuhCaiMQk7+
         YZSA==
X-Gm-Message-State: APuU4Z8jakB16jmsfnD14IScZTc2wGM5bQgth82nfjRgBCA7BdAQ610t
	I92VLRhlCB9Eaqmrw+gwzETWAbhNj3v/liLlDyrpr0Rcfs9I6kiEeCBx5iPf+3ErP85TA0FZozB
	qggdu8chbP4c80SNeByeaTe5C3vHl7eNoEZEfKA==
X-Received: from dybme13.prod.google.com ([2002:a05:7301:188d:b0:36b:c499:531f])
 (user=sarthakkukreti job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:c7c3:b0:376:972f:afa9 with SMTP id 5a478bee46e88-37966387a09mr993929eec.9.1794538165337;
 Thu, 12 Nov 2026 18:49:25 -0800 (PST)
Date: Thu, 12 Nov 2026 18:49:18 -0800
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261113024922.27977-1-sarthakkukreti@google.com>
Subject: [PATCH v2 0/3] usb: uas / scsi: fail inflight and queued commands on
 dead links
From: Sarthak Kukreti <sarthakkukreti@google.com>
To: Oliver Neukum <oneukum@suse.com>, Alan Stern <stern@rowland.harvard.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, 
	"Martin K . Petersen" <mkp@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sarthak Kukreti <sarthakkukreti@google.com>
Content-Type: text/plain; charset="UTF-8"

Unplugging a UAS device during system suspend after hub_wq is frozen
defers usb_disconnect() until hub_wq thaws. When sd_suspend_system()
issues SYNCHRONIZE_CACHE to the disconnected target:

1. If the HCD accepts the URBs, the status URB fails in uas_stat_cmplt()
   without completing the command, stranding SYNCHRONIZE_CACHE for the
   60s SCSI timeout and triggering the 25s DPM watchdog. Patch 1 tracks
   the active sense_urb per command and completes the owning command in
   uas_stat_cmplt() on status URB failure while unlinking any inflight
   data URBs.
2. If usb_submit_urb() fails with -ESHUTDOWN, -ENOENT, or -EHOSTUNREACH,
   uas_queuecommand_lck() requeues the command instead of failing it,
   and leaks unsubmitted URBs or orphans already-submitted URBs on
   partial submission failure. Patch 2 fails the command with
   DID_NO_CONNECT, frees unsubmitted URBs, and unlinks any submitted
   status or data URBs.
3. When the command completes with DID_NO_CONNECT,
   scsi_check_passthrough() matches SCMD_FAILURE_RESULT_ANY and retries
   it against the disconnected target. Patch 3 skips retries on
   DID_NO_CONNECT, DID_BAD_TARGET, and DID_TRANSPORT_FAILFAST.

Tested using a USB/IP (vhci_hcd) UAS target emulator that freezes
hub_wq, injects -EPROTO on the status URB during inflight
SYNCHRONIZE_CACHE and READ(10) commands, and verifies immediate
completion without DPM watchdog timeouts, along with the scsi_lib KUnit
test suite.

Changes in v2:
- Track sense_urb in uas_cmd_info and complete only the command owning
  the failed status URB in uas_stat_cmplt() instead of looping across
  all devinfo->cmnd[] slots and orphaning other commands' sense URBs.
- Set DID_NO_CONNECT only on -ENODEV and -ESHUTDOWN in uas_stat_cmplt()
  and uas_data_cmplt(), and DID_ERROR on other status/data URB errors.
- Clear pending submit and work flags and free unsubmitted URBs when
  completing commands on status URB or partial submission failure.
- Unlink already-submitted status and data URBs in
  uas_queuecommand_lck() when a later URB submission fails, and remove
  the unused out label.
- Add Fixes tags to all three patches.

v1:
  https://lore.kernel.org/r/20261113003536.3622755-1-sarthakkukreti@google.com

Sarthak Kukreti (3):
  usb: uas: complete command on status URB error
  usb: uas: fail command submission on fatal USB errors
  scsi: core: do not retry passthrough requests on disconnected targets

 drivers/scsi/scsi_lib.c      |   5 ++
 drivers/scsi/scsi_lib_test.c |   9 ++-
 drivers/usb/storage/uas.c    | 128 +++++++++++++++++++++++++++++------
 3 files changed, 122 insertions(+), 20 deletions(-)

-- 
2.56.0.611.g1030f0b940-goog

