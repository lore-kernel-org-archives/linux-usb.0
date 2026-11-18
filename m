Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794995129;
	b=NKbC50ibOOl0z6+52T5ubKuhmgyx0JY1LfohgIB1kRuECY8owNAsvUKjSwPEysR5U92W
	 kNcDVVzboWaX1+/fqzGOTE7+8lceeVhbegAetHFe8ZpmO71WYJ677eCv/nomzkI9i/lVS
	 NUuPaJLiybX3YaXrHKPPqDXVnm8Tz2aA/GNjwOvjESlxcw8K+mbsCEeln+tQWsNAlGBbD
	 zFJKzdZGqtZ5ncI/Q1/mMG02ZtHDqfqnRjbfKA//vlIZhr8P1fzHmn6tl5Uy4LsFbqugk
	 uY1x5WRxLPj68XjYwrkKttFSa1N2di/DQwfQN7xRm2+8XyriwKINBs66kOy2//CC+3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794995129;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=GhtdsB8BcpE7vjOa6dKteiWTmYqy6gdRjNGx4LTO2Ew=;
	b=B9GHj39gHsFLKagEvbHt4xOeeAb/mopL8c7LsQMf3E7KcDjx8xpm7u3WKBcNJBeJIFnq
	 biQ4xNlcpEFHn/1Cnp4HaDORtZKZkk7bzT3hXzjYsCM7SOhCsaPRdUUgKZNQWYrKJbRFU
	 XA8StrvJpFMOWfzu0sGu5wtXqnLIU2vzR9inIKLjqtXPqHbJ/gv7R6dcKm3/Ntw5zHDD0
	 nEo3Mmf76durBbXJX74shgR1Jkp64t8Kfuj5QVTv6Dg4Ijz7iqnf7U4bLuHTZypU+5z39
	 EoNaJkdto5L0/tUwh12p7gtbHunFUxJ/tJszvXwbsYe9yXK7QL0KJlA++Ty7xSpvLWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=dfWnRTD3;
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BA5606A338;
	Wed, 18 Nov 2026 09:45:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28BA5606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=dfWnRTD3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Gh
	tdsB8BcpE7vjOa6dKteiWTmYqy6gdRjNGx4LTO2Ew=; b=dfWnRTD32l/TBVgVsU
	TuxKlDKcJQmjWfwRmE9rbsIPHIkpkoDpwXucCRjIo5DWL6rcDXOWGatZcxJUDDa3
	sNOV5Heui6YMzxQo6NyGfsyZb/P2VRI95wl87TM4MUVeSOgNiCuQXxatzC9X78dY
	uAZ8129MbHneFUHdwQ0Ni4Nd8=
Received: from fedora1 (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgD3iqKnc_1qQHiHGg--.24535S2;
	Wed, 18 Nov 2026 17:45:11 +0800 (CST)
From: Ju Nan <junan76@163.com>
To: Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ju Nan <junan76@163.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: gadget: serial: reject port counts exceeding the array size
Date: Wed, 18 Nov 2026 17:38:40 +0800
Message-ID: <20261118093838.87616-3-junan76@163.com>
X-Mailer: git-send-email 2.56.1
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
X-CM-TRANSID:QCgvCgD3iqKnc_1qQHiHGg--.24535S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZr13Wr43Cr17ZFykZF17trb_yoWfZrg_ur
	n5Wr17ZrnrWay3Kw17K343Ary3Ka4Duwn5Z3WvgrWYyry2gasIga1Utw1kGF1Uu3W8GF95
	Ar17Way29F4fWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRtcTm7UUUUU==
X-CM-SenderInfo: pmxqt0ixw6il2tof0z/xtbC9Qcg0Wr9c6dUXQAA3J

The n_ports module parameter has no upper bound check, while fi_serial
and f_serial each contain only MAX_U_SERIAL_PORTS entries.

Reject n_ports values greater than MAX_U_SERIAL_PORTS in gserial_init(),
before registering the composite driver.

Signed-off-by: Ju Nan <junan76@163.com>
---
 drivers/usb/gadget/legacy/serial.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/gadget/legacy/serial.c b/drivers/usb/gadget/legacy/serial.c
index 4974bee6049a..20e89f052952 100644
--- a/drivers/usb/gadget/legacy/serial.c
+++ b/drivers/usb/gadget/legacy/serial.c
@@ -286,6 +286,9 @@ static int switch_gserial_enable(bool do_enable)
 
 static int __init gserial_init(void)
 {
+	if (n_ports > MAX_U_SERIAL_PORTS)
+		return -EINVAL;
+
 	/* We *could* export two configs; that'd be much cleaner...
 	 * but neither of these product IDs was defined that way.
 	 */
-- 
2.56.1

