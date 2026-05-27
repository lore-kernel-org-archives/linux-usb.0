Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7DA3A6EEB
	for <linux-usb@vger.kernel.org>; Wed, 27 May 2026 06:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779864111; cv=none; b=EqoitGnxIAXjlrTEJcoLuCv67XPdVVrYpt53WcbZLi8RprcDLi7exlLLpGRyNWgrPjawmcz2gOBe43HNK9ul63OPdeQVY07FsAwwH/qhA/ekA30SXnzW4XElKKLSgt1YVSOoGnZQrM4pZkT2ZZCJ/0JimmbeO/Q4SAZBbi2+xYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779864111; c=relaxed/simple;
	bh=NNUYMTCF+365bgC+7NpTKV7/7dhPFKfEp2//TaCS0Us=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QClsGQWDKu28fB2lfuBXjCyk0F6l05rpapL70DDbjnK6dPWyCkuQQOio0XiGGbrd+3WFd0H4PeNmqfU192HnKYEcmQfW/OFGXuYZf2hAZICLN1DFtXG0DBffPgvPKacNjKGHlWknOeuA64wWt9a7it6DexAVsfG7Dd2Yv2Qta1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=fIciVYPx; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="fIciVYPx"
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C99123F7D2
	for <linux-usb@vger.kernel.org>; Wed, 27 May 2026 06:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1779864097;
	bh=JihqlByVD4zw3LBRcRqpkLVmflWTkP0ezaDlgML+dlo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=fIciVYPx7gIr7RgXUlDMW5EbmXrFLBTFs3+U0nHUf0cmFMWg2WU5eoiAkPDrrNZb4
	 epQDlwnk6a3BYDFCso+c98zehkWWjp0wlybhvl/HI2DnvgqLHmF//P5docKAmlxVpc
	 qZUd3jQLk3mAjl8hon2fSaclEKKnu5aIm9zuy0zeAmBfJmftg/CmwafTtHbcNQzU5i
	 1OH+Zh9d5LVZdvxH0ySPogJocWQpjOqd+gz889e/l1ZvT6Yaoh/GA0tUWM6cn5biAi
	 3cc1xusx845/lA9TFIVY6ByDx5uAtbdAHci0Ncm0e6bVj0wqeaPQ6F9nVqHAkR6x5g
	 hitvv7KaSnxJ/ckZJtqapNevoV1/Dy7ZIELtMnzW2vj5AodUxTrcYHQajmo2Ate6+y
	 CibbnPKWSQfWhSY1UbREvD2v6SjI6abEAr2wnREQbH3XWGutzBIS8Pt9G3OXXKQKmi
	 C1AprfrVO/AUm3uo1NwtAzl1MF/xn3htCHwY4lwzKgIZ/OrsvZLemMZcHTf61PIQav
	 VlrZdxPMdLQHPntv4oi504FoAcPDVOiFcjQRdkS47Y/uRh/7RGDmjXUefHuk2irWQy
	 Xj5CGgMz4LHumcEvwjSaw6o40SvJdgn/AcYNV24Jv+e9ASWwGhIfOnytSsKI2usxUA
	 jF/cOm+4YPLhsoaKyr4J1h/8=
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2be9fa93a52so13028535ad.2
        for <linux-usb@vger.kernel.org>; Tue, 26 May 2026 23:41:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779864096; x=1780468896;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JihqlByVD4zw3LBRcRqpkLVmflWTkP0ezaDlgML+dlo=;
        b=rzNJBKChsmIW/F3TfKdtVRP5jTfrkaVn0FIolK2pn9NOMpzWdFc/8YmOMaPjQ4Z6A3
         Y3IYRj5Ed1EzeFrt3l8rPZLzY5LhiJWmfRR9hLVm5Nui5spGOB6JF/AULhS2LTMpaOBj
         sr1kKTZ++hwnNkMo8wgxuMNlSba08Q1feZDQMjV310+kicRqidZ8ol7S+YEkM83S2IiN
         AmOqyLh5OhlclSfnZBhfYMjAnp/RrC9VqT9bXSWespR952DBjUHhvkqu4IA7NhMtUWBa
         cgU5znsYSr9IPmLQSH20xvSjFgKiiRPqe6JrddnpMyIGYP7cFJin7u+uPGbxFVnoWSv8
         hNGA==
X-Forwarded-Encrypted: i=1; AFNElJ9mMTXIHeRX7WgbfI6UzjeGI51evKZjMdv7FvR/PcjmyLo0MZMmAiFJZYlZfLdMwItcDUfBreDaWaQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywske0iMeagMaOKwaVcCEAFUKblaVEORI07IMvn3+DO1WUldiaN
	h6QrPQFWYXeZVKaGdMmRkA9Jv2FIANkGFeP6yy+Ct8uKCUhbb798+N8st43xbYSicEw7ozGMPQq
	bV/j8djr93oQNMK4eY+KyDxj0Lje9nCWcP3yTFQUoZVlEpGiOh6toRpiLP6FGd9KARANe+gArtJ
	rQDQ==
X-Gm-Gg: Acq92OHUbGenyLSos+2Eqzu0yG1MBvxkahQc61aeYQsvZ95C2Nsp6ErCO0rLpcwd7ST
	kTvHqlZil9RJwVa6Nd+DBaFauS7F+BVOmdGFQTlyMk6ltS+pBN9STXiTxr73tzmsGtfZRnl/eCc
	1t1kX7eof70srzJfaAImIbZRw2VYcnZUi3JK8AJ8nLuKzN1c8SB1eVOdZWAksGDt+ScFcK0tQju
	GoMEXtVQGpFwSSdyN0oONkjvyu0wuGghl6WbnkRgg35NOKRuvx6v6j/xIMZJlafDNEZsMXjZkKd
	SRp0PsDxneI44ApLAOrr3MX9F3WaaFCcm8VhozX/RYgX/sMQuDre7XIbs7A1P6Uhftrx8tAOenn
	ADbv3yuD69YHmzi1oNRpH/5OgnNVsU1EW7YoW5K7VVujfURB0LkZORPGqY7b+2AB/Mdts87xPwI
	zmsWfVv/JEcjJBO90THiZVbd9LWvp3dqZ8pp6mw8aSq8qpqVaEs71FuZwFcLNZxLBBfM8HGhXmV
	eqfmFHu
X-Received: by 2002:a17:903:2ec3:b0:2ba:1e94:d03b with SMTP id d9443c01a7336-2beb06acd0fmr121668385ad.6.1779864096230;
        Tue, 26 May 2026 23:41:36 -0700 (PDT)
X-Received: by 2002:a17:903:2ec3:b0:2ba:1e94:d03b with SMTP id d9443c01a7336-2beb06acd0fmr121668285ad.6.1779864095904;
        Tue, 26 May 2026 23:41:35 -0700 (PDT)
Received: from an-XPS-15-9520.buildd (2001-b011-2008-658f-4fd7-7372-71f3-d446.dynamic-ip6.hinet.net. [2001:b011:2008:658f:4fd7:7372:71f3:d446])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58fef85sm141361335ad.75.2026.05.26.23.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 23:41:35 -0700 (PDT)
From: ChunAn Wu <an.wu@canonical.com>
To: mika.westerberg@linux.intel.com
Cc: andreas.noever@gmail.com,
	michael.jamet@intel.com,
	YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/1] thunderbolt: Defer DP tunnel teardown until display driver is ready
Date: Wed, 27 May 2026 14:41:20 +0800
Message-Id: <20260527064121.173952-1-an.wu@canonical.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

On systems with Full Disk Encryption (LUKS), the Thunderbolt driver
loads from initramfs early in boot and discovers the BIOS-established
DP tunnel. It starts DPRX polling, waiting for the GPU driver to read
DPCD from the connected monitor so the router firmware can set the
DPRX_DONE bit. However, the GPU driver resides on the encrypted root
filesystem and cannot load until the user enters the passphrase --
which takes an unbounded amount of time.

The 12-second DPRX timeout fires, and tb_dp_resource_unavailable()
permanently removes the DP IN adapter from dp_resources. The external
display stays blank with no software recovery path -- only physically
re-plugging the dock brings it back.

This patch defers the DP tunnel teardown when no PCI display driver
has bound yet. At DPRX timeout, we check whether any PCI display
class (0x03xx) device has a driver. If not, the tunnel is torn down
but the DP IN resource is kept in the available list. A PCI bus
notifier watches for BUS_NOTIFY_BOUND_DRIVER on display class
devices. When the GPU driver eventually binds, the notifier
schedules a work item that calls tb_tunnel_dp() to re-establish
the connection. By that point the GPU has already read DPCD during
its probe, so DPRX_DONE is already set and the tunnel activates
immediately.

If a display driver is already bound when the timeout fires, the
existing teardown behavior is preserved -- this indicates a real
failure (bad cable, disconnected display, etc.) rather than a
timing issue.

Considerations:

 - All GPU drivers on x86 (i915, xe, amdgpu, nouveau) register as
   PCI drivers with base class 0x03, so a single PCI bus notifier
   covers all vendors with no GPU driver changes needed.

 - The notifier fires after probe() succeeds (BUS_NOTIFY_BOUND_DRIVER),
   which means the GPU has already initialized the display engine and
   performed DPCD reads -- the retry succeeds immediately.

 - On suspend/resume the existing tunnel re-establishment paths are
   used; this patch only affects the initial boot timing issue.

Testing:

 - Hardware: Dell Pro Max 14 MC14250, Dell SD25TB5
   Thunderbolt 5 Dock, external BenQ monitor, LUKS full disk
   encryption.

 - Reproduced the issue: TB loaded at T+1s, DPRX teardown at
   T+14s, i915 loaded at T+84s, display blank.

 - With the patch: TB loaded at T+1s, DPRX timeout at T+14s
   printed "not active, deferring until display driver loads",
   i915 loaded at T+72s, notifier triggered retry, display
   came up successfully.

 - Also tested with i915 blacklisted at boot and loaded via a
   systemd service after a 30-second delay to simulate the FDE
   gap in a controlled way. The 58-second gap between timeout
   and GPU loading was handled correctly.

 - Verified that dock hotplug (GPU already loaded) still works
   normally -- the display_bound flag is true and the existing
   code path is taken.

ChunAn Wu (1):
  thunderbolt: Defer DP tunnel teardown until display driver is ready

 drivers/thunderbolt/tb.c | 97 ++++++++++++++++++++++++++++++++++------
 1 file changed, 89 insertions(+), 8 deletions(-)

-- 
2.34.1
