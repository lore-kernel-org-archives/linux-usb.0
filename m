Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795679585;
	b=ndjfPsreuXUdbSeVlMqT7jTte9wwtntUeUrlBSR6jD7n/VpDp7B9aJKnLLBjFjpIBoJ7
	 xjZU+m1lZTR7cC+vuiLwDGMocjCJSHK09tuUTn5iuXsf8/cDwgZM4BXwIp9jsc2/Cp9KU
	 psj3Y0Y6t7DEwKKKJHQJpHXG1CDZhW5swW6n+aNSK2YTMDnubBOUCIH2urK4uFjUJmx2A
	 XgvC7Iyz+Hs8U4pxVsb46wqa+rHXJ7pzHTzeOI4oowVem+nZT6M4N+iNhL5N5mH++xU9z
	 Je+hFg2MGGFJnyvZhPB0FhAfWmgiD/jk1AQCcqg+v2QUSZQjMuYp25pUvX4S+uMKdcQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795679585;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=yzIZvPAMWRpanZNanKaIeNPuG5tI7riEE06xEUsBxMQ=;
	b=LUCvnKClY1xSFZnZcRSh6nN/io1XqTKYIXScHHFewP9yd2b/J5RPUp6/FKx3xCnhaXKL
	 LqrJyWvRl38OyW6caFXbyK+urE95mlO5YcJr69QeMtufoijA+XMbIVlMkP5z5zpRuODee
	 4GSVPhMehJK7/oiq37WGGdahzWEi41DxPv/E1kyTduXdO05jiltfid0zKJGyaHcHtKP9q
	 AXSzG5QSgFrpx96etcoNl68coDDP9J+MszU5hOeKHWCxhUTwFLekCwRzem8WIkXhpUC9S
	 LUcwO0PhF3gHlAs2+QMrCMvMxOvdIvc8AKs2MoAgtpaaZ6amLIgIn2lzR2ZgmSLWZ6g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dXaX6gaV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D04606A31C
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 07:53:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39D04606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dXaX6gaV
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-847ac7ccd85so3837204a34.3
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 23:53:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795679584; cv=none;
        d=google.com; s=arc-20260327;
        b=bqqNmx17M34rixftVyb+49WbQlyGzpWLzX9tsA79nyre7H2DJuZWx8hE9bTVmUeqKt
         IvchuWOkdg+ggF4E3ngpxnUQDB5yl92zRYjc0MdZrt1bE5vhZrvqRy12TNTWRrGpFdpn
         w2vdhTASVCRrSH1jwigs2dSDk18ABEDuGoD8Yxp41EXgloKVViZGpLeHJ7nWKaUHqIJv
         m7by1daipLCeUiLNN4cvjVJy6wunMVAAbatZqxy7U15pkU+lx7mVolo0mi0xbHLF+Xjn
         oqGoay5TQIEsmXKNz5+p2dHR9Wo6ij3WRYEKMJ3Pt4VWNgAxZUyTjUixYifGWreYTNlk
         ARwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=yzIZvPAMWRpanZNanKaIeNPuG5tI7riEE06xEUsBxMQ=;
        fh=uW0XYUSLYx4DU/FDhFl9q/odVc0v6vpfh+gHDAJi5Rs=;
        b=q4taBt7l2zFJobb8IZTLLULdnxK/gtQdKyD/A29GjvHgExPJtEd3rHZePy8viRs3tX
         kd5DuxfIjUZQ4Wo51wbD2oJ6u4+YQLhKnD2zPQDGOj9Stl6AcCYWqc+ZUqD8pWn8pVpp
         wr2H99ipRs7h6xZf61uhFBnTF37iSsvQXckWTHbzIpYhrEVzM9JB9VcV0pPmn/q9Qxfe
         Iruyjk+bsPQp2m4V6fDSuogOVRuXJ2vkX/DMezAt9TyPrqPdV+ZmKD106b/WeEUJGMxF
         TkS56mHgGW+fi2flKWT39Mjx4wbkGB7ECLdoeie9ebqb5nl9r8ZgRbDq/TRpI4Xpj1ZL
         AE+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795679584; x=1796284384; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yzIZvPAMWRpanZNanKaIeNPuG5tI7riEE06xEUsBxMQ=;
        b=dXaX6gaVPEpBSG1a4DW1qqD5jfU78SQmUFKYJutzcBBuh05xCQs7aaVmknFM8GhNtI
         FSyt0KMUFIeSXrEbMh1bZqfEQW3Ymz8r5SAWAL1loMPxTIHyGAmSAGSQWeZiEnYDMDNA
         bFVtex5YCY1BqOuRrdYYuSV6cpGFKzN0Cie2hmRtZWQdxxS7eF1JzoYBYd0TPiowNp2z
         dqupeYOe1imzvhfLaYJp3bRPCd9RW2Zjbcz+SkHKU2bi8CLtOj5ednRPfPX3ibfy0Jq+
         zwWz8UaoBMBPO8ZjXi0r0VjXioo1TABCWN5kLinto7eFrm1Rrx/h/YwHqixA8Bf18rpM
         +ogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795679584; x=1796284384;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yzIZvPAMWRpanZNanKaIeNPuG5tI7riEE06xEUsBxMQ=;
        b=MjYd+9p/VWeuRm/5dFItPy3dgdPSAVDibaarXovWOcVzpa4lBGEvVabdJjMepzNI43
         5A8ONwwbq1FTkBgDuAW/WPm5m9zqDLIp4BmALkhWfuRcqKryHZQ1gSN/lvrScdKfQUPU
         1NubN5MBKbkTtiyqdmQIRrzFAs/5a8Ly24KXVzOCCQABbU4/HA06UG820z5rXbLdtNPg
         6R2SVrjPekfbpPgpUbs6sNRJPCazXiHgkFzxbUe8X/K4y2JMFsTDHHX6hPGBU1v4O6k9
         50XqKV+2NtYSAsxfEhfxYQ3/Lk+Ozzdw5XobuzZUq3RBSyisIFBlqTZlnq/SKwrQKmT0
         U4+w==
X-Gm-Message-State: APuU4Z/EcJ0u9Qroi0WiDzeP/c4BZKBovG70YHPSfewXJ0KcCb6+cJyM
	ZqGibvTGn8CndP1SUEIUKJxLA60NNbN6LTDn9/th17yiDTNDJlU435dq3+lBqkW/nyX8P6MdPjl
	nu4TprXsPpW2liEgrsQ5HqXQtU6KDUGu5iscL
X-Gm-Gg: AZFdTZe54t+jFEwQs0hkM9b+cUbolVrgqxTip4uhio2bOOsT8H84GPogWF8MnWqPOAn
	yt119lI7Mm1HCVyFAQlGarRMBXZv9+clh57WbMM1ztGk1+Pp6xgIDFTjQ2K0Rb0TLjyi+e4T1Sc
	OsbqUouEb3LoWRS7IqlcxF0mW65GrBiNvtsiez0oTBS9/G6N758AEyed7V4yAO5m+MGS/Xldk3j
	PQhYO7oQjGh7XUv2Qx3y4Gp0qIitJ5WyemhwQn+ctx5JnLoMiHtB6e08lospudcuX+bXIfI2Vjp
	aeP4t3g2J+vybWbbeLkvnO/pqcKnLPG41TkbvLOLYnBfQNAOQ9Zb2Lm+sUxnpcpmWVyLRsFgWSt
	NOqqTork00OcOjpUy8mv8ZI+KRVRoe6MV8oJ42/7S2MsLCXMPGJKj0vPnxDdi5urPYw==
X-Received: by 2002:a05:6808:178f:b0:55c:888:30ff with SMTP id
 5614622812f47-57a0bb6edfbmr22917560b6e.45.1795679584108; Wed, 25 Nov 2026
 23:53:04 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 26 Nov 2026 07:53:02 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Lee Youngjoon <getfeus@gmail.com>
Date: Thu, 26 Nov 2026 07:53:02 +0000
X-Gm-Features: Aa3M54oRNFlRfF9nHUJQxOdIqVCkVuZIpejqbVhd1Y_O8sr1Oa2Dxu_tj0Coi9k
Message-ID: <CA+m4KrCtvNdz8o0abjKONb0Ys78VPk54egzCDydpvgyZs0pWuQ@mail.gmail.com>
Subject: [PATCH v1 0/2] usb: typec: ucsi: gaokun: Fix DP detach and
 orientation ordering
To: Pengyu Luo <mitltlatltl@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

On the Huawei MateBook E Go we observed two cases where the display
driver got an incomplete or premature hotplug indication.

On unplug, the EC can report no CC orientation, no mux and HPD low in
one update. The DP SVID is already gone when the driver checks whether
to notify the bridge. Patch 1 remembers a previously forwarded high and
delivers low once for this physical detach.

On attach, a UCSI connector-status notification can precede the EC
report containing the new DP orientation. On the right port we saw EC
REVERSE with the QMP PHY still at NORMAL and channel equalization timing
out. On a successful reconnect in the same physical orientation, both
reported REVERSE and both lanes trained. Patch 2 sets the orientation
switch from the fresh EC report before programming the mux. It withholds
high if setup fails and preserves the detach notification.

This is based on usb-next plus the two patches in the Gaokun port-update
series [1]. Its per-port event path serializes EC mode updates. Both
prerequisite patch IDs follow the diffstat. The separate HPD_IRQ work
[2] touches the same bridge call and handles sink interrupts. If it
lands first I can rebase, preserving its IRQ indication for DP reports.

I built an arm64 Image and modules after each patch. For a cable-free
host test, replay right-port bytes 09/19 followed by 02/00 twice, with
the right update bit set. Observe switch, mux, bridge and PAN calls.
Expect high on the DP report, one low across the two empty reports and
one ACK per processed frame. A switch or mux failure on a high frame
should withhold high; a fresh valid report should succeed. A host-side
test also held a status write in flight while delivering the fresh DP
frame and checked the final hardware-facing orientation.

The earlier hardware build had the left charger connected throughout.
The monitor showed video on the first attach and reconnect in one plug
orientation, and on reconnect in the other. The first flipped attach
showed no video and no right Type-C partner was observed in the samples.
EDID cleared on all three removals that began with a populated EDID.

Those hardware results are from the prototype. This posting obtains
its own switch handle and selects ports with a DP bridge and DP report.
The Type-C status callback continues to publish the class orientation;
a separate switch write from the EC event can precede that publication.
The exact posted series has been built and replay-tested, and still
needs a board run.

OpenAI Codex assisted with source inspection, implementation, tests and
drafting this series.

Thanks,
Lee Youngjoon

[1] https://lore.kernel.org/r/CA+m4KrA14J-3ovbau1EGjvwc1R4Maya3wzqD+n-_khotDhcRFQ@mail.gmail.com
[2] https://lore.kernel.org/r/20261024-hpd-irq-events-v8-9-6ee949e7a384@oss.qualcomm.com

Lee Youngjoon (2):
  usb: typec: ucsi: gaokun: Forward HPD low on physical detach
  usb: typec: ucsi: gaokun: Set orientation before switching to DP

 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c | 68 +++++++++++++++++++--
 1 file changed, 62 insertions(+), 6 deletions(-)


base-commit: 90d6263e867be7089b3d3323bef8d2accd327c77
prerequisite-patch-id: cfd37d1c2c80a677a55355503949110e2a427bef
prerequisite-patch-id: dae17ae41b9e4a6710e956900347d5d637ae39fd
