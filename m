Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794434255;
	b=nqhzRQ5vpEbs5lWhEi8H29i78zE3ll/cuzXTUgjF7+kHF2/mp52A/MFkmw3bvuNmJ83V
	 gPfEOGfx76ibizYmxzCT+CWNF4cIbyXLw0rFFN00YlDJOT4ymjFgbxCP9q6bbrdPX6e2M
	 NpDTuKYLlmGFBp05dax14XvoDp+gnSU3KpEFH57DTj9puR/YTYh25S9k5rrDgHDAilK67
	 vpABUVXLiacQwlfMLnMIR0Lovevb7I/zAbUvhGRqqHUN5eKEINhPO++TpygJXn3Pi7sAJ
	 ze11t0HpQV7CZ2tLs9WLOwrSZSkqOHkZxwPtUoofdYG0+5M0CFj1eyzpc+QyoKSF/qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794434255;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SpxeEyGCBIe2pmFodowG7QVxBvAwlFcEp0A+XN+w7cc=;
	b=f/bLO8W4venqzbGxjGtfIlW2rCCEDkGmKqqRhhJoyVcPLfbQhgAyI6v5YPcJco44elrb
	 tLIiAV7fb23iguDjLApv5jjtj+vpAHA5sW9OftDIhLOoEXX0q0eeTbu9xpGqfVe+MOWia
	 YsFlIyerDjR8K9zYOZIrQw5/5s0bjzAvhYmDxCj9/lFJntgpSsNlfpqIxpfSQPICX6mXG
	 GVos3gLm34yFlU8aMB7epoXmdTd5uZ49OOC9ZtLrgKLYKm7hExT34Ji2e8Vg/cAcDQhjN
	 4rfc3W3KrrZqF5UTcKrWONvqQj+Pumw9W5xOyAV2qQA97UHVNT47PJ5oS34NXB8oodQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nEQlVa7S;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775EA606A882
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 21:57:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 775EA606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nEQlVa7S
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so7057636eec.0
        for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 13:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794434255; x=1795039055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SpxeEyGCBIe2pmFodowG7QVxBvAwlFcEp0A+XN+w7cc=;
        b=nEQlVa7SBqq5wJgUoTQc0s6JCfis1TV1le55JeVM4syZGTmNngYzCg3Zyltd0lK+Ox
         XTKKuObijblBkqafA7E8qpcMVg62I77jo49rqLT640mDOr9OUoofzd1h8qsHDMTm0q77
         lNm74rfCLHwzuwDMmZo4D5pXFiPlcA6DA6aDeqhT49PhrCpV7+gkzCbpUmap0O8qbkV3
         /EEwLA9ARHl05MSOrb3woRUXjJkDJMF4Z7gvqMCIKQs6ZehuENwy++kvYFoO3pQxKspH
         j3bwqpvBow2fabNc5eoWT0Y+H90vaRhaLbv9TC9dmouPLwV0a5qzRg4XUeOyodmKItH2
         IYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794434255; x=1795039055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SpxeEyGCBIe2pmFodowG7QVxBvAwlFcEp0A+XN+w7cc=;
        b=NHaq/bsdEFYA3Ocozj3HNeCIRwmSamDZjoNQy3G/jfEy15Ivd3Y/3B4K+BIwPrAey1
         9L+nVlM6mm7C08ZXVTT7DeACbFowRxC2sFlE9OQItbJxticgU698kXux6/0cbzdPlOyN
         OzY/9yXczxFQGYwatj+2ZUKAaHxM3ZgXWoaVH8rr/ywf8iTqQEjFwqYR35WJIpVhPJPm
         cTNxf9aDHVycfdcwCvEbFk6V+Vl37oAPLI+6kk7qfkCHULymgKfXr9YfVF9iuyzTrK02
         mcuYhfQLrPh2trj2NKsX7eyumB0SpRGzv7e7Fl5jv9A4lSmuoFDlN0iIGogOShbit8xl
         oioA==
X-Forwarded-Encrypted: i=1; AL+hErGgAGG2gEqKeNgok6Mvw8S/xHJhKSOxa3/kb53SiZ30l18x18fkXhgN4JdyaD2yXm2GETKMw+wTuzw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0UF4xUBWCNoOOHwmlaLgnGm/Gnwh8QpLMK4alO/X5Fz/X4agd
	5MKCFvuv2Xw2PvgW2NKKG9OCI6PIp+P6souj770cEF1qlRM1cDjqyx1mNbaw2Q==
X-Gm-Gg: AYBFou3WHOgkU7PCnAXlVjT66jQMgcnLnMT4W6X+t8SIIedrA2oC6+yJ0x0i1QtxNPy
	olvY3OD0weMdlj5TBsAkyQhN4ZsPwtBdDSlCAU+wOIdc64u2QaZAAyQQB2GhmO66KpXD66E1fCF
	YXTdqB/r8mMj8HS2ND/xCCVraUc+bsy947JWay7IpPh77GRysiCIQ7OB0b6DAZSLDd3w6pq20X4
	AdzPrtaOLn3Ey3viMB/s33pSjn9VB25/VBEW/JAau93wQLrZAbw2EoQ9hU/f6V0Jmfzk/Mc7BJm
	fF0tjgxlLQ2CsO1eF3GU53hrXNrjsXX5RP+vLYBx9UDHRCyx+XTHZvEbML9ljc20H4JMl0znEO7
	CwV8g8T2PuB26kAl4QS5wkYTuPh1QamETuziz8fK8ttRi6CTCMkOLKxBC4Ydhh2AW1a4JAWUCRZ
	MHFwIWKIbZhykR8HyueY0swHMgj5gU3CVyZFhmduxYSPEG8waHA7jbmyjZ7OmMtkdvPZvW2QfvN
	twbv/bqZS7/uAzsAFM5BH7whvn+FiCLQOtWbuGCCa14BaRh9KPxt1EJIDregLl5Rmfb8I2j/chV
	gy98l1Z1nKpXK97xYj5kYyVzSSmbQKdN1dI3sbiyBPqL1nyyFapgN1hZVPdDQcwCGYCI7huAY3e
	12DOV7C37RLaiQsIMag==
X-Received: by 2002:a05:693c:60cd:b0:369:f18f:3492 with SMTP id 5a478bee46e88-37686d38d9dmr5076667eec.35.1794434254626;
        Wed, 11 Nov 2026 13:57:34 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:eb83:637b:7b26:8dfe])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751dae6377sm17823523eec.3.2026.11.11.13.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:57:33 -0800 (PST)
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
Subject: [PATCH 1/2] powerpc/configs: drop CONFIG_INPUT_YEALINK from ppc6xx_defconfig
Date: Wed, 11 Nov 2026 13:57:22 -0800
Message-ID: <20261111215723.3802209-2-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
In-Reply-To: <20261111215723.3802209-1-dmitry.torokhov@gmail.com>
References: <20261111215723.3802209-1-dmitry.torokhov@gmail.com>
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

The yealink driver is obsolete and being removed. Drop its module
selection from ppc6xx_defconfig.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/powerpc/configs/ppc6xx_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
index 8aab229fb909..29acc77573d6 100644
--- a/arch/powerpc/configs/ppc6xx_defconfig
+++ b/arch/powerpc/configs/ppc6xx_defconfig
@@ -537,7 +537,6 @@ CONFIG_INPUT_PCSPKR=m
 CONFIG_INPUT_ATI_REMOTE2=m
 CONFIG_INPUT_KEYSPAN_REMOTE=m
 CONFIG_INPUT_POWERMATE=m
-CONFIG_INPUT_YEALINK=m
 CONFIG_INPUT_CM109=m
 CONFIG_INPUT_UINPUT=m
 CONFIG_SERIO_RAW=m
-- 
2.56.0.567.gdb80ae8cd5-goog

