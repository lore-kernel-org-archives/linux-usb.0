Received: from esa.hc5016-32.iphmx.com (esa.hc5016-32.iphmx.com [207.54.87.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6730A3ADB97;
	Fri, 24 Jul 2026 22:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.54.87.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784932017; cv=none; b=f3oFaHs3aS9TLPq4NFUkn80vYbDEhkA+61USQXEgZuUTn1VIT9hOeQf82IbL1wW3MYaQNsPmPvBIw8e/7SPs3tlS/USNcOZ2chNf1jjT3lvur6MHKtJjl6n30zobDZ75gFEXPCrQBjiyBTbjq8EgOQ5LuS5tRq5fraqUU8NDhfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784932017; c=relaxed/simple;
	bh=rW+uTKvuQyVepmbhOZ/i48vzRE9RhDoEcUl2NC6EPKo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bySY65+o5LYxrIsQu+H4a4YEMBZw3t1DtyDN4Oq9oRf9IGC9iOx47SoSjVZMW+mflU418VnUgCAdWQVhOnW5fmBZPD5ZPnfK2mnXfrbuGHNDq3RbUlRBi1UsZPldxHgOkNp75oN02HORpwZ1psPF1Nu5ymht5J1kLIRzYtOIBWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=harman.com; spf=pass smtp.mailfrom=harman.com; dkim=pass (2048-bit key) header.d=harman.com header.i=@harman.com header.b=mFkZi/GW; arc=none smtp.client-ip=207.54.87.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=harman.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=harman.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=harman.com header.i=@harman.com header.b="mFkZi/GW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=harman.com; i=@harman.com; q=dns/txt; s=CES-HARMAN1;
  t=1784932018; x=1816468018;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FiLOgfMiCJvHv7uBNaT7cdcPNmdS4EvzAdcVcvYBKbo=;
  b=mFkZi/GW3zuSJecioYQW/tWJYE0t6JlaLDoh8yxtL8ilpLVc7ZLcIjbD
   uH426aqF9lhR2teiqqv2Cn2tYJzWep+cFcm5+eiXAswfNoXE4NIHONen5
   tHPXV1avnl8Rae1SKqkpjdZlSP9U+obDj4oLRsUVF9IJ2AOVT3Juc94SF
   53G2hA/9GW9LWH+piAF9hsaez5wPsd6S+GwPclpSuhAJzGBE3BLJCVuOG
   litzgs4YRSX61TyanQj2Qq8s/eZamnKQCOaTGoPnxCs5I8rN87YNUZlXw
   XX2gwBr/INJe+FbEOyCKDr5bxJ8Uijza237YT9X0dkWFXdJt/SftqHCsl
   w==;
X-CSE-ConnectionGUID: v5No/Ld1Tb6o5Omd09ty0g==
X-CSE-MsgGUID: eOCynVaFSZuyobHdoMoYNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11855"; a="119726132"
X-IronPort-AV: E=Sophos;i="6.25,183,1779163200"; 
   d="scan'208";a="119726132"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO INMDWSHYB10.ad.harman.com) ([199.27.113.4])
  by esa7.hc5016-32.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 18:26:56 -0400
Received: from INMDWSHYB09.ad.harman.com (10.92.6.246) by
 INMDWSHYB10.ad.harman.com (10.92.6.249) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sat, 25 Jul 2026 03:56:51 +0530
Received: from awsmblx423bs002.localdomain (10.63.34.68) by
 INMDWSHYB09.ad.harman.com (10.92.6.254) with Microsoft SMTP Server id
 15.2.2562.43 via Frontend Transport; Sat, 25 Jul 2026 03:56:51 +0530
Received: by awsmblx423bs002.localdomain (Postfix, from userid 530975)
	id 667547D7ED; Fri, 24 Jul 2026 22:26:51 +0000 (UTC)
From: Akshay Gujar <Akshay.Gujar@harman.com>
To: <gregkh@linuxfoundation.org>
CC: <Akshay.Gujar@harman.com>, <linux-kernel@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <naveen.v@harman.com>, <oneukum@suse.com>,
	<stern@rowland.harvard.edu>
Subject: Re: [PATCH v5 0/3] driver core: add enumeration failure uevent helper
Date: Fri, 24 Jul 2026 22:26:51 +0000
Message-ID: <20260724222651.471889-1-Akshay.Gujar@harman.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <2026071745-share-paternity-df8c@gregkh>
References: <2026071745-share-paternity-df8c@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

On Fri, Jul 17, 2026 at 12:35:33PM +0200, Greg KH wrote:
> > Hotpluggable buses can detect that a device is physically present, but
> > enumeration may still fail early due to protocol-level errors. Today,
> > such failures are only reported via kernel log messages, with no
> > structured userspace notification.
> >  
> > This series introduces a small, generic helper in the driver core that
> > emits a KOBJ_CHANGE uevent when enumeration fails, and wires it into the
> > USB hub enumeration failure path as an initial user.
> >  
> > The USB change is intentionally minimal and serves as an initial user of
> > the generic helper. Other subsystems may use the helper independently if
> > needed.
> 
> There are some review comments on the documentation patch here:
> 	https://sashiko.dev/#/patchset/20260715114028.3627807-1-Akshay.Gujar@harman.com
> that look correct.  This will not be an interface message, but a device
> message, right?

The uevent is currently emitted from the hub's usb_interface device,
not the port. usb_port devices have no bus or class, so
dev_uevent_filter() drops any uevent sent from them. The failing port
is identified in the payload (DEVICE_ENUMERATION_FAILURE=usb1-port1)
rather than by the emitting device. The documentation example was
captured from real hardware, which is why it shows DEVTYPE=usb_interface.

Per your feedback on patch 1/3, v6 will make this explicit, the helper
takes the emitting device and the failed identifier as separate
arguments, and the bus driver states both directly.

> And what about the dev_name() issue?

Yes, dev_name() can return NULL for a device that fails before
dev_set_name(), and kasprintf() would then hand userspace the
meaningless string "DEVICE_ENUMERATION_FAILURE=(null)".

The v6 interface will eliminates this, the identifier becomes an explicit
argument validated by the helper:

	int device_enumeration_failure_notify(struct device *dev,
					      const char *failed_id);

	if (!dev || !failed_id || !*failed_id)
		return -EINVAL;

so a NULL or empty identifier is rejected before anything reaches
userspace. For the current USB caller this could not occur (the port
device is named at registration), but the check is needed for a
generic helper.

Thanks,
Akshay
