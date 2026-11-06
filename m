Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793945580;
	b=ZY8PAlNM9b0ovgOCYtArXYMZ8crmDwE2FS71g2ZEmHAcgsp6xjytDxjEZ3nNTd5XVko1
	 DYjDnhSZyTve96so32wD2HWDAxayQXzgR9GEA7RFA3ordMCH7MIEMHOt426L/WJww69fT
	 H9TidsKhQT1QPzq43MGnlZGKbiUKEWrTw2tDcLyfQ9ZZ3n3S13oVYAMKZHXdLRPeXQ/q6
	 9Bq4qzk3ObhkGpKVPvGnajlznDYgsp5LMcivfIbXc3bXm/CrP/WBaro5ohwl+ELDFte5/
	 8Bqty/8N7ducYww7NDm+X+yvNbZHs+MaTjK5zIcMxs7URK695w2hAVqJabz4A2HSYyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793945580;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yqC5kqEmzZTPK10ulwI68LiQM+78XkN3IO/N+99yYEU=;
	b=feiPcS8HFNnVDxwR9rnz7MtUFma0BmK/hjchTzVXQonlLrXf3STltDHZTmNxLoVAM+Hc
	 2l+lJbptSbBAXiYjjicH99N1KtzPAZmYH7KGEoFrycUsUAhVCSU0PwsFPGRjRe0RdmlQA
	 mKLx0pYBBBhufQ7XI9IjcAb8UbW3JZ0HePtQhTJONvTotv86/RJE79ymwRHrXu44rRnGR
	 4iDcbQxELNjPevrKv5IQSuKYCWHOu+6DfyEQ0spBKZ+9GTtwM8KjjWXcjAMIluBasQJBs
	 lvb5KaSIfWBWzc2p+8mHac1wpPuTa1a5ptlUb8O4KpTAixf1aY01Kz033B+bcXuN23w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=dn1UgjEw;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E915606A32C
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 06:12:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E915606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=dn1UgjEw
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36fb88ea38cso297834eec.1
        for <linux-usb@vger.kernel.org>; Thu, 05 Nov 2026 22:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1793945577; x=1794550377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yqC5kqEmzZTPK10ulwI68LiQM+78XkN3IO/N+99yYEU=;
        b=dn1UgjEwd9O1KMrjxmyVATBPLW/7Tg+o2uk2jNpDRJ7zln5a9gi68UkEyZVo8vYyj+
         Iwn2B/rPOzXwdxYUEPeJ3/DFyPZI2ERmxaM5V4W0P0bMsKcvplZ7dI+5BQlasOzp9Ovr
         oAivFEe5Kjmd9p5BPIJ19HEVAh/k7wvsN1fZpM/3LU6z45eCT7E/PPFW/q0o5x37Ga2a
         5GXbjhfxQ0fXJdT8q7bkPlq2Dss94yOEFN1aI3jm8cPSEsMoN8I+oD4fcaBOKZN0g7X0
         bi/Vx5cSU4SRxAMTBdOkquHotduIUnIRokW/O8KCqb5RFuyR9mRiOdh0sXIO+dhsY9XG
         eZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793945577; x=1794550377;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yqC5kqEmzZTPK10ulwI68LiQM+78XkN3IO/N+99yYEU=;
        b=1X/3BzLYlL+wabkVnzT8a46uQZW7IHd7PhI3qxSnTzrWRtP9tKerciRx+q+2sDc0Lh
         EkIiDzdAUMX0bgQyRSwyYbUho2Y8HxeYSo9u+jsW9hlD4pWy3fCWSXo3KV1w0gA/Xima
         e+UL7Uf+aujzz/SSYInP1Eeoga9rYwIDvFiaWDkYtSWKe9whu4KCQe5vUId5WmQjquM2
         VQV4jysOUJMrpx30h1+JC+KiUf5A5a+ABor1yQDfIP9D197X6/4HX8K5GluRNrxe+2nu
         5Rz6J9amyhCkkfZ1sRQ9gDqeLXqkyjGyGN1m062e3VbZVjPXIsoqmDtn08n6b2FRO3q3
         cz7g==
X-Forwarded-Encrypted: i=1; AL+hErFuEDNIiPRIYa/iIPmp8PZ4qYK0AT8fX+FXDaZXvuwEnUvAnV89UIsu++kG6SnCY/OTrMCi5enRIds=@vger.kernel.org
X-Gm-Message-State: APuU4Z9v9M56WjJMvMCXUzBdBGHFjI57U+oXXlg6/swErtHh5TlQr3bE
	kTDF4OVRSkAkKmRL4e+WI11CKVTa06Ed65CGUVqGvqGBmnupOc9r0Vc0kkp75rc4kQ==
X-Gm-Gg: AYBFou3rKart7j7FBTMSQ7Xmqh0FDOFVkUPSGW9dQue1Rze9MojwGKS9L7z+lXb/IlH
	wb4XyAUBujsf22AKsLXjrQegfEnfHEaI3WcPZkJGhlnFRQq7iFApIqmpPLa/CIJBsj6YR/4w318
	MkMXrO23r4Q3dQOpJac8JcOfGrPYEcUDID6DP5YqU3bcfnyta8/zmL8wXqDhmEyN4HPvlCZWGBf
	TtFqfZlicZCaMApgkh/M3uvIiRlH/unvw7zcS5wa/FwTZQRVl5f3WKeCN4EgtqXG/NcteYZqD2L
	CstZYQt2ZX0qeG0Fh3VhBLjRgubXl/eBgCP15I7Fl0H9ybSQvJ8QCG8Qxaj5FURLIhfo2ljfkIq
	9Kz9SLAywLf/K6B848SvTbjlxAsQAp9wFHTM+OMHP5cEmsal73EyDbXj6bP+cjvVx7expzpCrwo
	k7tWIB+A2DJtVAg2Uags1fKgwagDlRs4Dil3xztj2ZzyvjfkkWLQThnw40lXwto7UB7NDHe2mPQ
	aBevCZeIdIDqjgI7zdMuCXKna9A0UT9abl5F5aD0wRf63MK18fUGSI4jCgmAxNWknDh19VA6LGt
	X7Un4UBz8LQFa/AqevdMwMt/sysxMGBfJ+yL0pUXMD1+/93H7c+EypouhCLCsRkbAhXbqHqxLOS
	TVAwRgqCgxUbi+F1f/Q==
X-Received: by 2002:a05:7300:8a14:b0:343:5f5f:eef0 with SMTP id 5a478bee46e88-36de7432bb6mr6742335eec.21.1793945577142;
        Thu, 05 Nov 2026 22:12:57 -0800 (PST)
Received: from cantal.lan ([58.136.77.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa922c6c7sm3755879eec.10.2026.11.05.22.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:12:56 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Stern <stern@rowland.harvard.edu>
Cc: Johan Hovold <johan@kernel.org>,
	Bastien Nocera <hadess@hadess.net>,
	Matthias Kaehlcke <mka@chromium.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Douglas Anderson <dianders@chromium.org>,
	Robert Nelson <robertcnelson@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [PATCH v4 0/2] usb: misc: onboard_usb_dev: don't defer probing after the device is configured
Date: Fri,  6 Nov 2026 13:12:49 +0700
Message-ID: <cover.1793941292.git.jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
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

On a BeagleY-AI, kernels since commit f918e3804498 ("arm64: enable
HAVE_SHARED_GPIOS for all ARM64 platforms") no longer boot: the on-board
USB hub is re-probed in a loop, because onboard_usb_dev defers probing
after the hub has been configured.

v3 added a pre_probe callback to the USB core, which turned out to add
significant complexity. v4 follows Johan Hovold's other suggestion [1]
instead. Patch 1 exports the generic driver's operations. Patch 2
changes onboard_usb_dev to call them itself instead of setting
generic_subclass.

Tested on the BeagleY-AI on top of v7.4-rc1: the board boots normally,
and unbinding and rebinding the onboard-usb-dev platform device works.

I used an LLM coding assistant to help prepare this series.

[1] https://lore.kernel.org/all/auSdA8MfolA8OhdM@hovoldconsulting.com/

v3: https://lore.kernel.org/all/cover.1793669297.git.jjc@jclark.com/
v2: https://lore.kernel.org/all/20261030151919.3511106-1-jjc@jclark.com/
v1: https://lore.kernel.org/all/20261030114705.3159093-1-jjc@jclark.com/

James Clark (2):
  usb: core: export the generic device driver's operations
  usb: misc: onboard_usb_dev: don't defer probing after the device is
    configured

 drivers/usb/core/generic.c         |  4 ++++
 drivers/usb/core/usb.h             |  6 ------
 drivers/usb/misc/onboard_usb_dev.c | 14 +++++++++++---
 include/linux/usb.h                | 10 +++++++++-
 4 files changed, 24 insertions(+), 10 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0

