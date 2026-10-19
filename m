Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75AC34A5C3E
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 09:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792400487; cv=none; b=c2bzqooE5BBkPvpFJR24DCObuaKGnON4lC4qgWCjddIXknVrTbVrZAGHJTbaeSYArE164jIg8hy33Zyi42h0GpcZk98r5GM/fPwo/UEJHPvvdPLxfwGZnWO2T5gJ5EsEsaI27GBo908S0dRT3osPutFHA/NtFzJZEaeyg78FBhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792400487; c=relaxed/simple;
	bh=ISGLybjkKHk4ZABVfkFT1ydPZlLsqwmBvVyFe1NRoTY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nV5Nn30t5f2H5GtJ4SLYips23rMu/i7MGYkk0g5JFybK2zVF+W+K0r0rJGTn/RCRGm3VlPXYhmf22dxRj4hmqyPIZ0plKFB2RRZ7/G4nac7B3/7VAnvnbkyDS+mKw4X2ITCrns8RszFqvM3Q2ZtbCb+wdCafrXA5PDh2qc9bQCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f2YiBJr8; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f2YiBJr8"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a0e1b0681bso12941555e9.3
        for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 02:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792400484; x=1793005284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rCjG1qUBFd8Lkeu0pATJzv+SvPg5QuT3Ybijv+USoe4=;
        b=f2YiBJr8YWgHCQ7dX3QK/a0ghLQO3tpp9SdQQWc22u0ytMEowXtccfe2dd5VECyMgg
         vFMJ28IZhKycKJlA3WkIJaHi2Qg2Bo05HrnKn7S5KYAcQRq5rE3Qqa8IAIXlGF1JCc4q
         82ZqSJ3Iir4o2u5vYFws5JgX9/U+pdyD9H2Uvp7KPRxia+TYPPL1cz2Rz1KgXuEf6mJF
         FH3NeK87d20ZLWJM509G2/ER2ApgzzT9S3mWfC2bBScqqX715tOXE2ltXQ8oeUxHNyno
         iOAKFQaLOZty1OSsVIxXJg9Hs+65FNVyU/2rTZdgmWLwPIRDo4Z9TAw3g7Ma1QlbDBNc
         aUVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792400484; x=1793005284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rCjG1qUBFd8Lkeu0pATJzv+SvPg5QuT3Ybijv+USoe4=;
        b=ik5AFHBxsqyPPyte5TDYpM9tdo1t7Z4+8mbLifgMv1P5cvAZBbwbie0L0oXec7tMyB
         04MBDg/MGgW/YD4gYZ1IUf4eNmhgdptosLYAY5mOefPvgohmoQIbJCcmTpfWW7+liEb6
         tSdXRHc5aGsx7E5Kd1ODTVOdGLbEILH8lMaQCQ0fqd5cZlPVGP+ALgV3+qPrANLobhz3
         lDLkqttr3YMm/H6tZJtssNwqV8pRYwN7mbfAnrK96QSBfPNn70O0fNQxD+JUB9pTajW8
         uMt+Rsal07yNO20/lg2ncSzKR1L4zd3wC11D4NeD5dXDbrV7THJ4e9RcuoEc89poxp9L
         Zr8g==
X-Forwarded-Encrypted: i=1; AKwUvBy1fUG0wefyDQ65c/60C5qdwL/YLiPNOL0Ubgm/Teoml+GdfCKi46SFV4RbDPj2HDC55rfH4aka2ZQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKnAZ7GpSJ5d2JOw9H7b+c67Gfrgi8onjNU27sBQ7y3zCH+IAUU
	x+DM2PWWNck13Y3phqsUu4Lk3Xx2h3/9E/jLNbCYJcHst9X5s/u+YtNG
X-Gm-Gg: AYBFou2M6u9bh/JEuEEDldCwpt1hA/emyED7J2q4f/aTFuOR+F0uXeB6I4A3n7W4IEm
	kwg65y+cGXyzgWWqjSJLzXcX//V+0yU12eOh6sTqoY+FXCoprbX9Q0FnxWD/hYZl8I2xR4sIk7K
	WJLzaB0GkZ78GRgaePMmSn/y0BIh/7cm/CqdUy/oo6Qk9sjcn/BG77HECIRhuN4/yujwkcgtLWB
	DosqCM0vJSaeiwJxUAfk5jvDqd8rKLZGX4q3PN7DQE9qoFuMU8zrOsl3QKzH00kze33JIpC9ukw
	O00nau3cwbGXDbqcGXxDFZCoOBeYstDNMkUhMmAyiRIbhuMel/wwdQf/4kC38onYzPpwOmKJqrr
	NNQmQCobuHWRkI0crx43PGizFSIu+kpkwefOopBraFzGlrp+jp1NmPWB0KTE+rJ8QMcJCMpViws
	6Gd6HMdkCfdGMmmpkKaIJMSBNABkyI8XESvlhtr7sHqebXyyXI3IFYhH6oFONkVveUZiFMorLYH
	QMT
X-Received: by 2002:a05:600c:4684:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-4a1d76001e9mr141175875e9.16.1792400484365;
        Mon, 19 Oct 2026 02:01:24 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cca30aa4sm118260635e9.2.2026.10.19.02.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:01:06 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Neill Kapron <nkapron@google.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Wayne Chang <waynec@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Felipe Balbi <balbi@ti.com>,
	Felipe Balbi <balbi@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH v2 0/2] usb: gadget: u_serial: flush_buffer, and keep the port for its tty
Date: Mon, 19 Oct 2026 10:58:53 +0200
Message-ID: <20261019085855.3259716-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

On a gadget whose host side does not read the port, the last close of
/dev/ttyGS* waits GS_CLOSE_TIMEOUT (15 s) for the write buffer to drain,
and tcflush(TCOFLUSH) cannot avoid that because u_serial has no
flush_buffer operation. v1 added it.

Sashiko pointed out that the hangup gserial_disconnect() schedules can
then call flush_buffer after gserial_free_line() has freed the port.
That window is older than the new callback: the tty core already reads
the freed port there, KASAN reports it in check_tty_count() with a
delay added to gs_close(). Patch 1 makes the port live as long as its
tty, with a tty_port reference taken in install and dropped in cleanup
as cdc-acm does, and carries Fixes and Cc stable. Patch 2 is v1.

Changes in v2:
- new patch 1, the port lifetime fix
- patch 2 unchanged

v1: https://lore.kernel.org/linux-usb/20261015162732.3170938-1-mehmet.fide@gmail.com/

Tested on a Verdin AM62 with KASAN and lockdep, 6.12.113 plus both
patches: with a 3 s delay in gs_close() the hangup after
gserial_free_line() no longer reports a use-after-free and the port is
freed after the tty; four function teardowns, two with the port open,
free four ports without leaks or warnings; close after tcflush returns
at once with the host not reading and the data written after the flush
arrives; 47850 flushes against a concurrent writer; NCM torn down
under iperf traffic. The same two patches run in our i.MX8MP and VF50
product images on CI rigs, gadget replug included. On usb-next both
patches build with W=1 and sparse without new warnings, each on its own.

Mehmet Fide (2):
  usb: gadget: u_serial: keep the port until its tty is released
  usb: gadget: u_serial: implement flush_buffer

 drivers/usb/gadget/function/u_serial.c | 59 +++++++++++++++++++++++++-
 1 file changed, 57 insertions(+), 2 deletions(-)


base-commit: 04ac7b445880b0878c83e6e89d961455cbea0427
-- 
2.55.0

