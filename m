Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D54E1429D;
	Mon, 25 May 2026 19:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779736179; cv=none; b=o4JWDKEwsPTvzcSQ0AT1tMaAobOA9GVloLCa/0arVI5qywv0Qbyl7NVO9jMAxiFhpI8USUQLA/ZG9R+VydfShxU9cU6retnLCXfgrhz+2Jb/r0CoKaFhJhhkXYgb8CV1SK8PVeCFUXS0IeZBfGvPdY1rt4PcVI7jIWLKTDrSTYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779736179; c=relaxed/simple;
	bh=BWeRmevKGYeovDNKFvkqj38EMhnzxXtQGVyk30z/i7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T/g60Mbv0rwS30agD2YR7sbkHohBrA+GlMnkIvagD0UaRi7xKh5D4gNh+eLRggIzdHIBvTTHhwT6XESd/8duhZ93WWNfgZweEpSWFwxMCWjLfkAZc79i72bi8WeA0fbWzxkolz/U4dkN0853eTgbwcUn0zSgSgp/9NwFrq1GnWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=iEWRH64D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="iEWRH64D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 592E41F000E9;
	Mon, 25 May 2026 19:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779736178;
	bh=BWeRmevKGYeovDNKFvkqj38EMhnzxXtQGVyk30z/i7Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iEWRH64DmeZlxC0OY5+AAMyKGQEPZviLVLgO91k1nL2xeci4NXjJ3p/K6toBPekj0
	 RavUi17Kr0Bz9dZT2xMIRYTcQAiS5EnPojPDWRheX8APsrh+4Xd1IB3YwWkpJeXPka
	 NGCopB/gDUf2kEFe69Jc+vHxFIzdeAKhADZG61cc=
Date: Mon, 25 May 2026 21:08:45 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Adrian Korwel <adriank20047@gmail.com>
Cc: linux-usb@vger.kernel.org, stable@vger.kernel.org,
	heikki.krogerus@linux.intel.com
Subject: Re: [PATCH v2] usb: gadget: f_uac1_legacy: fix use-after-free in
 gaudio_open_snd_dev()
Message-ID: <2026052517-undergrad-reformat-44bc@gregkh>
References: <CADgB2mFBdTbad5+W=bDOMO+fe1S4jg+aCNjkgd3B3Guq0WFQdw@mail.gmail.com>
 <2026052528-resupply-fanatic-496a@gregkh>
 <CADgB2mH8VayssgQmuyfMJn8Vv-o8_udfL6msVGrHrL1hO9nd4g@mail.gmail.com>
 <CADgB2mFC436hPxF1FpP2OgO7iY8KVaF3igiWe1mTTB=BJFgmmw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADgB2mFC436hPxF1FpP2OgO7iY8KVaF3igiWe1mTTB=BJFgmmw@mail.gmail.com>

On Mon, May 25, 2026 at 09:37:52AM -0500, Adrian Korwel wrote:
> [PATCH v3 4/4] usb: typec: thunderbolt: cancel work before altmode is removed

Something went really wrong with this series, always use git send-email
or something else that can properly send patches :(

thanks,

greg k-h
