Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9C24248C6
	for <linux-usb@vger.kernel.org>; Sun,  4 Oct 2026 10:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791111092; cv=none; b=mrOm5t8VNdii3iSRlfQmSOQRo4Fy/w0KmKZq7IHP5t8/CTAZmOJjQuEznqjX0yed1kYBbixT2wqVtOSkFO+rFm+CovtChXvuXTppcLs7TNUGQlCgG6L/wyvfhRZOwQlj6w79y9Xw+6cUh5tJDyozZO4mN6Lv/6Aj3IFNgmCISH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791111092; c=relaxed/simple;
	bh=4MRxwd7MzrAqfyJ7mimlrfGaFAcX/tkMDz0Yg+CsHtE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LetkmKTrpO2L9tMzklB2vHbbj6nGT8pgHDQ70ma4378E8SkzAcC7gApw1qIzbFLccUxjlUMlC0phWgsrv51F6oPVBK9fpL0f/C2e1bt4s/io720vpJ33MD2m97IC9ZS6I2SgmwYwVBBz8su7VEmg0e4snAI/ihWtSyyN+sLSpPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OVA34rGy; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OVA34rGy"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-35129e4607cso148316eec.1
        for <linux-usb@vger.kernel.org>; Sun, 04 Oct 2026 03:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791111087; x=1791715887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OU10JUkOnCjExkP9pLJslSiL15VSpV7uAw3VaBnuTMo=;
        b=OVA34rGyoQxPo0wRv2zEemiSYWkKsDXwZStVOByBQRpu1DQU+Ux1wXdGhPRfPWJ2ht
         ouzg/l9fDoy4wZ4euP5p8lSaoWg9rG9fZaKYtejcMe2sLNInHQTJRfxfmQZMe1qawkEv
         rk+ljgwDABA0aWwMOyjO7W2/GmSrlrEnlMsehl8voU4xsbmKVz9gk/Ogj6oGfr8ii6sS
         l3qesCpMjIJp2mX/KknTTgJj92xvPMlxpmMvI3gaZdf5nWW0UYLAXpFpOv2tT9v3D2Li
         xbUQ3aLXlQsME980CGogDR3xWSx3k1tqD8k2m/VTgDE0NLGWeD4a92JNkkElYfXQZNzC
         HlPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791111087; x=1791715887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OU10JUkOnCjExkP9pLJslSiL15VSpV7uAw3VaBnuTMo=;
        b=Mj/sQ2j9IiBU6WVD5pS6T44wWOpBH3/iEpvC9QGpfKSfzaYPv9OnWcj2vRQDb9JIYQ
         8+TR/lYPYtd7Q1sP+YqRcISbLlYSNLXOxq8frkg0ChuHrgpDUfrw+zfjb7HR4PsXW2JA
         AbLpQenbDRyfPiovfwnKGhSq59JK8pG87V1ALiD+oHLQukQyvlf2Zp0TpqhSfN6vBs1f
         z3tIiYJghsH0CgmxMlq9fytHGrxIeOw8mJo886JaT8FREcfiEIDspblNfXGk3NV9khv8
         m4bnE1riJG25ynNqeGWftgHgsIjXFTihIvLJCK37R8t/9qM04y4bDWBlNRuBmnLtF4hA
         M8EQ==
X-Forwarded-Encrypted: i=1; AKwUvBwP0hfqlBSlSy26u6ZsiBBauQTlssPQdcDT48m5dxDeIyB2ijddqSpxW18sJ7l/5TLC+QpbHPfZSx8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIiQcYPqpG1FWF1+5uYaM7U8Nm1Ywlk29CHFWdmydrp/c2bBk/L
	wYb50X6E1dubdWcFBU+OgZDui3ghNJEQVBpOH2M+CYzVAe9+hKlIDPT+
X-Gm-Gg: AYBFou26co0qqjfYn/niCBr601kTWjpD5DBLazf7GWPDuygaXXkAjItNn1p4PD/ektX
	25OV2XEqZisoR/e/lheFiewtIaUjWR+zo2z30A+zd0zT8fX7m173gi2A897X9DXNCUraJg4RrUQ
	uoa4SWDcYjslMAfj2c6hKO8NMcxnx87zagqeg65Arv1iEZG1e/DeRxb28jM26RLWlkJcCopAzki
	RQcfwTTp5n9QCcPTMEIURS3GhEjpRUJsGBiIoWRduAnEGsr3OcdqA4/t6kvQjTa5HG2avO8FZOg
	x9OOq5OMGRtrA5r1U0j8ffw5xaxcsWF1GO5opzEmUxM2sYBwGy6xViwm0d5Nfw1jdiioYe4buJc
	+wLQnO60fBaPrLTbfCfUsf9J+ZwKicEaIe4FGf2h9/2KroLhtYTEZHvTlwrzjldMxow2VpqtlMP
	Xz7Infy9EsRNnsZGPR22UXCDwW6pVhj+kXvmu+IbQEDxZdLCLecHt1YEIbPPgF0oaku2Lj4K5nG
	6FQu1AnbwCd2ZTBgG3aCqBijrGHtxv/Zpl8uH0m2KktqSE=
X-Received: by 2002:a05:7300:e5c2:b0:341:3ca2:de2d with SMTP id 5a478bee46e88-34f15077edfmr9383419eec.6.1791111087081;
        Sun, 04 Oct 2026 03:51:27 -0700 (PDT)
Received: from Anshuman ([123.63.59.156])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35127161474sm3815965eec.13.2026.10.04.03.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 03:51:26 -0700 (PDT)
From: Anshuman <anshumantewari123@gmail.com>
To: kees@kernel.org
Cc: Frank.Li@kernel.org,
	James.Bottomley@HansenPartnership.com,
	airlied@gmail.com,
	akpm@linux-foundation.org,
	andriy.shevchenko@linux.intel.com,
	anton.ivanov@cambridgegreys.com,
	apparmor@lists.ubuntu.com,
	atomlin@atomlin.com,
	benjamin.berg@intel.com,
	bhelgaas@google.com,
	bp@alien8.de,
	bvanassche@acm.org,
	corey@minyard.net,
	da.gomez@kernel.org,
	daniel.lezcano@kernel.org,
	dave.hansen@linux.intel.com,
	david.e.box@linux.intel.com,
	dmaengine@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	dvyukov@google.com,
	elver@google.com,
	eperezma@redhat.com,
	georgia.garcia@canonical.com,
	glider@google.com,
	gor@linux.ibm.com,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	hare@suse.de,
	hca@linux.ibm.com,
	hpa@zytor.com,
	ilpo.jarvinen@linux.intel.com,
	intel-gfx@lists.freedesktop.org,
	jani.nikula@linux.intel.com,
	jasowang@redhat.com,
	jbaron@akamai.com,
	jgg@ziepe.ca,
	jim.cromie@gmail.com,
	jirislaby@kernel.org,
	jmorris@namei.org,
	johannes@sipsolutions.net,
	john.johansen@canonical.com,
	joonas.lahtinen@linux.intel.com,
	kasan-dev@googlegroups.com,
	kvm@vger.kernel.org,
	laurent.pinchart@ideasonboard.com,
	lenb@kernel.org,
	leon@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mm@kvack.org,
	linux-modules@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-usb@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	lukasz.luba@arm.com,
	macro@orcam.me.uk,
	martin.petersen@oracle.com,
	mcgrof@kernel.org,
	mchehab@kernel.org,
	mingo@redhat.com,
	mst@redhat.com,
	netdev@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	paul@paul-moore.com,
	pbonzini@redhat.com,
	pengpeng@iscas.ac.cn,
	peterz@infradead.org,
	petr.pavlu@suse.com,
	qemu-devel@nongnu.org,
	rafael@kernel.org,
	richard@nod.at,
	rodrigo.vivi@intel.com,
	rui.zhang@intel.com,
	samitolvanen@google.com,
	seanjc@google.com,
	serge@hallyn.com,
	simona@ffwll.ch,
	somlo@cmu.edu,
	srinivas.pandruvada@linux.intel.com,
	stable@vger.kernel.org,
	stern@rowland.harvard.edu,
	tglx@kernel.org,
	tiwei.btw@antgroup.com,
	tursulin@ursulin.net,
	usb-storage@lists.one-eyed-alien.net,
	virtualization@lists.linux.dev,
	vkoul@kernel.org,
	x86@kernel.org,
	xuanzhuo@linux.alibaba.com
Subject: Re: [PATCH 01/11] params: bound array element output to the caller's page buffer
Date: Sun,  4 Oct 2026 16:17:41 +0530
Message-ID: <20261004104741.51238-1-anshumantewari123@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260521133326.2465264-1-kees@kernel.org>
References: <20260521133326.2465264-1-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, May 21, 2026 at 06:33:14AM -0700, Kees Cook wrote:
> ret = min(ret, (int)(PAGE_SIZE - 1 - off));
> if (!ret)
> 	break;

One question about the truncation behavior here: when an element does
not fully fit in the remaining buffer, this min() can cause only part
of that element to be copied. For example, if the remaining space is
4 bytes and the next element produces "123456789\n", the resulting
output could contain only "1234".

This leaves the reader with no way to distinguish a genuinely short
value from one that was truncated due to the PAGE_SIZE limit, while
the array otherwise still looks like a normal comma-separated list.

Is this partial-element truncation intentional for this patch, or is
the expectation that it gets handled as part of the later seq_buf
conversion? Would it be preferable to avoid copying an element unless
it fits completely, and leave the larger-buffer case to be addressed
later in the series?
