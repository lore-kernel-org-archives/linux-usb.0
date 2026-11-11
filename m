Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794434251;
	b=vEKgtIFLqd+q6kFTC4FbnMLxS4e18AQanWp+kbDmiJt3gz01rLh5BWgDt9pcDazu5Wv9
	 Bo8LXLPFvsbQWupWLSDYlM9OZCbdWJhX2NKJBJXUCrb5+iMQpnE1EIU+N83cA/TQx1wmj
	 8REPyKNIN1/4kS5oG40rQOGpuQuB/tAWbjisWAG7huUEamo0RuSBCVw+nNePEV8z0XKj4
	 CyZDvEyXl+N0h1uI+/HTR5RtPujPertI30EPPcID57g30WJwmb1bWqgwDNI5zlI1+1SLU
	 ZZ13qYBZKLXuheHVbGMxsAUn+mvnSObMGHgJjGbKalL0UdUGuSVVPIha/EQtwjYeWBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794434251;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1ggCgsA+NJ3WO/E1t+Aq1JDPeicUUtkRHraZJ7K1wtc=;
	b=C227mh37uyanCVVmSBYWh5z+x/NiDSBNnMT59De53F7FwalsSsiVoIAeP8KkZLBtLzIT
	 F5n40mxWLO3QJQRQAK4YPM/vGnfITqiB9auq+xMpHLXPsaGKFyFhD8eO1KbMcCcIJC6jz
	 JiTsWkT/wBhyS5aVrXCjUFSiIFUp8aAOZmI3Bpd1ZCRdokcvBSgSDnDeFa6e9RFU9z62E
	 qUN3urtSLIkKZ3NhPzciLZ5ST0DWuS/lZxT2Gloc86J7HOdofICdRyn+8m9SXl33SiX4A
	 8oo12Uu5PZcOEj04HJtD73e6LCiOxsb8eVtaYHWGxPW9Tczm8IX9vCNAzRF61GO5AKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dpRqHE6w;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0454F606A31C
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 21:57:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0454F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dpRqHE6w
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3704d30b84fso4587072eec.1
        for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 13:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794434250; x=1795039050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1ggCgsA+NJ3WO/E1t+Aq1JDPeicUUtkRHraZJ7K1wtc=;
        b=dpRqHE6wmn5/kypQAavyk2ufy8OymjXbdHszRThOGjX0jhpHZE2qgnjwzT3Vy1/b41
         yQ4Gi3hSMKciusY7qlEJ5+14hX1uBKQfaMxw5cA9h2m6f2Am4HkhyTRKppbGkixO96I9
         4xshsjXZE3rQFOSViTCZVmT9vw1xcGdCrxvzRzieFMx4zhtiRLUIObcxOwBbp+LDcplg
         A6OM9KKLpskJGQyuytSPCIf/ZJCEx7YbYp9PX4Rpv6SrtWlfX1tPBRbZKQWvjwWIf2fz
         TQxHreUPkPkn9Z+C4+hQ+743rtYhXfedsICOSLIje0r6hLPhyzp3psTVzDLlw1t16rGn
         EHxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794434250; x=1795039050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ggCgsA+NJ3WO/E1t+Aq1JDPeicUUtkRHraZJ7K1wtc=;
        b=gGl23lmLi+j8OksE7ON9y89HnzkctZUvgYh9R7d4iwNg7+o6yh/WGbQ6FgtIX/aeHE
         UqAQSbs72ORUpGwFA6I4QiVY/vmkIKDkSZA99wBP8mAbIezm3P1jEJJQhFPMlbOI/I3l
         wEFL9Hf3n+fQUaALFn1/HaseD7B0Gcc4Vx5dg+ATg172U6zzUTaWmSLtri2SzZnqS1Fh
         f5USAu+wBszYNEyx88ceyQalJNmA+TYMS3KVmldIpIhfK/STfswRyYWsd6F8qCW0TS0t
         UUO4SngkqlyG2Xj4XZgN7i+C6kT6QyoRVS4JwblyNouYvXguJZfXJJn9UTOUGKAQZi+2
         X2YQ==
X-Forwarded-Encrypted: i=1; AL+hErGBRWU7SSLM/idstja0/a/9Rju5yQNhpypnqVFxk17T9jYv0D51oZz81ZbGtWlJiaZN704dkSY7G0w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/T+OsIHkdCv1oCEYU+UeIqSxhrJXmmK8+dTijr4uhuy3JEunqV
	ohS6NTU35yh7dEeI++bsesOEXB6qCSdxptNGXTZy70CB2jrM10buTBiI
X-Gm-Gg: AYBFou3TgYz5z639W6SrLsSqpySNE4LaEl1nOfXqTGzsKPXtppmHv4ib9RybctOspD8
	BCYsSvGronl0kUEtSV5Ugs85NxECMlnPWwNdEtqD2b9vaf8RH7tggGcuhi7J+Dr3T37IpA5Pj71
	7MQKTuYC6nfIA5aJ/cGsZb8OggUypltAU0Wasjz2xmGxLrnCFp89v2A55OwbWxUhejVdacIW7Q+
	GepLtx7SFDMcM4P3W6wQo3MSsOJo7KxOyuJIE5FsFDRzDnXaU272+4E/U1ohcx4gBs/ENrPGTBk
	eGTsBksd8bKEfmJHdZnSxCzqmxH7jeUqKmgWOgxR2AYYvokIqitws+NTN2e4HdhkDEbE80z1ODZ
	j39XuZuPfroXkyPomkf/LPzJUKmWIh4zbZCHsYPIBkmkHgVCujV9xVcVRSnlPcRH2SHNQ0EqnKE
	gxDKgfu2y90VfZpneDsrtH03mFcx3hhCk8YnRkjn5h3rWEecTWLf758bGMCHoXjh7yKDTLuOeyP
	vgwWJjJDqWFLM1m5oLvGMB41Cnu5Qfht2CcMswMb/AfZ4iaZDj9LNNklMIIqT4MAne0IBVE5efN
	m40/SF1IBnYXEvOONPqU0bu39ToeN1nP7GRtIDbiMRgLin/IqrhcOnqrdn1T4dQfbI6GLj7KLDc
	zQ1y86/+uRLeMinFv6g==
X-Received: by 2002:a05:7300:2d2b:b0:36d:2704:6adf with SMTP id 5a478bee46e88-3768579df8bmr5681391eec.11.1794434249909;
        Wed, 11 Nov 2026 13:57:29 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:eb83:637b:7b26:8dfe])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751dae6377sm17823523eec.3.2026.11.11.13.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:57:27 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Henk Vergonet <Henk.Vergonet@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>
Cc: Oliver Neukum <oneukum@suse.com>,
	Martin Diehl <m-diehl@gmx.de>,
	"Alfred E . Heggestad" <aeh@db.org>,
	Thomas Reitmayr <treitmayr@devbase.at>,
	Slawomir Stepien <sst@poczta.fm>,
	Jie Wang <jie.wang@intel.com>,
	Manuel Ebner <manuelebnerli@mailbox.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	usbb2k-api-dev@nongnu.org,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Input: remove obsolete yealink USB phone driver
Date: Wed, 11 Nov 2026 13:57:21 -0800
Message-ID: <20261111215723.3802209-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
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

This short series removes the obsolete yealink driver for the mid-2000s
Yealink USB-P1K (0x6993:0xb001) USB 1.1 Skype/VoIP telephone handset
and drops its module selection from ppc6xx_defconfig.

The hardware relied on dedicated userspace bridge utilities (such as
usbb2k-api / kb2kskype for the defunct legacy Skype desktop API, or
yeaphone for liblinphone) to drive its keypad, segmented LCD, and tones
through custom sysfs attributes. That userspace ecosystem has been
unmaintained for over 15 years, and the driver itself has seen no
functional updates, hardware testing, or new device IDs since 2008
while continuing to attract syzbot USB fuzzing reports and drive-by
cleanup patches.

Thanks.

Dmitry Torokhov (2):
  powerpc/configs: drop CONFIG_INPUT_YEALINK from ppc6xx_defconfig
  Input: yealink - remove driver

 Documentation/.renames.txt              |   1 -
 Documentation/input/devices/yealink.rst | 226 ------
 MAINTAINERS                             |   6 -
 arch/powerpc/configs/ppc6xx_defconfig   |   1 -
 drivers/hid/hid-ids.h                   |   3 -
 drivers/hid/hid-quirks.c                |   1 -
 drivers/input/misc/Kconfig              |  15 -
 drivers/input/misc/Makefile             |   1 -
 drivers/input/misc/yealink.c            | 950 ------------------------
 drivers/input/misc/yealink.h            | 206 -----
 10 files changed, 1410 deletions(-)
 delete mode 100644 Documentation/input/devices/yealink.rst
 delete mode 100644 drivers/input/misc/yealink.c
 delete mode 100644 drivers/input/misc/yealink.h

-- 
2.56.0.567.gdb80ae8cd5-goog

