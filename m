Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FD143E9DF
	for <linux-usb@vger.kernel.org>; Fri, 27 Feb 2026 16:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772209405; cv=none; b=m89OYVA664P2VoEN4ItokDU7GaG2oAJA+Flp2VJI6Qq5Rx9KXGnJY9WWBCb3lMkePcJfy6Y+Nf5Pl15bLgePjYurRchzdtqjARpfr9eFfYniwLEtWn4w5ZhFgjhWp63uZZqgIu9KrisX1UFph9MdWPS3hC5bNDZYBwgWJM85vjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772209405; c=relaxed/simple;
	bh=fa5zaKighvpqZdrDX1tdkIh6XDmEX089ArwzxZZgZxI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DjDsoRgOWM5UHarS1m1a+U022NOKdyiCdeAuL9yH/nBHeAjYvSzw9may5zapmdde7euNcXn0j9rMSKFxWdQ9Nd/BnwaPk/AJ+s4brzz3iWmSYXYoCiALZOvrZimVSh8x2J/E0583mrJhfm0p8nWqQcmWovnN4XhB5Blr083sHas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com; spf=pass smtp.mailfrom=korsgaard.com; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=RIbrJO4e; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="RIbrJO4e"
DKIM-Signature: a=rsa-sha256; b=RIbrJO4eNN7a1N8cPR2Y2Jc9J1QyJwbudJCule9rvYofg31zOcaqTZWMUSnTxHvrGBJ8R003RnEjEnxjvwgKamx25hDCfRpULGsqe/pj5ahXukYbPQJAbuBgexfSRxAKquR/V5GKS2Q52Dbg87g+sJPKkam3eO2WwarU/EV01gWOBUnVREBTT/UFRy9xKrWPSfI/vdBFtR/5reQpJ4MofYHW27r7uuDpDAJdb6fVfAL5uSB/7YVcBu8zpBfySw3OX9BYah9TdyGbnMxcce5UySVg6Bkg0YOaxYWFIHSZPWIBz+puWwjvv3rfNwyQVPiN3p0SrkmqTOG1Se9tKSM00g==; s=purelymail3; d=purelymail.com; v=1; bh=fa5zaKighvpqZdrDX1tdkIh6XDmEX089ArwzxZZgZxI=; h=Feedback-ID:Received:Received:From:To:Subject:Date;
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: linux-usb@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -978057167;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Fri, 27 Feb 2026 16:22:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
	(envelope-from <peter@korsgaard.com>)
	id 1vw0bx-000000085Gx-48t1;
	Fri, 27 Feb 2026 17:22:41 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: John Keeping <jkeeping@inmusicbrands.com>
Cc: linux-usb@vger.kernel.org,  Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Jiri Kosina <jikos@kernel.org>,  Yuhao
 Jiang <danisjiang@gmail.com>,  Ben Hoff <hoff.benjamin.k@gmail.com>,
  Michael Kelley <mhklinux@outlook.com>,  Terry Junge
 <linuxhid@cosmicgizmosystems.com>,  William Wu
 <william.wu@rock-chips.com>,  Kees Cook <kees@kernel.org>,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: f_hid: fix SuperSpeed descriptors
In-Reply-To: <20260227111540.431521-1-jkeeping@inmusicbrands.com> (John
	Keeping's message of "Fri, 27 Feb 2026 11:15:39 +0000")
References: <20260227111540.431521-1-jkeeping@inmusicbrands.com>
Date: Fri, 27 Feb 2026 17:22:41 +0100
Message-ID: <875x7iqhpq.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

>>>>> "John" == John Keeping <jkeeping@inmusicbrands.com> writes:

 > When adding dynamic configuration for bInterval, the value was removed
 > from the static SuperSpeed endpoint descriptors but was not set from the
 > configured value in hidg_bind().  Thus at SuperSpeed the interrupt
 > endpoints have bInterval as zero which is not valid per the USB
 > specification.

 > Add the missing setting for SuperSpeed endpoints.

 > Fixes: ea34925f5b2ee ("usb: gadget: hid: allow dynamic interval configuration via configfs")
 > Signed-off-by: John Keeping <jkeeping@inmusicbrands.com>

Acked-by: Peter Korsgaard <peter@korsgaard.com>

-- 
Bye, Peter Korsgaard
