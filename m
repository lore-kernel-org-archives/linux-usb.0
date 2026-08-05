Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3053D357CEC;
	Wed,  5 Aug 2026 07:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785916307; cv=none; b=Jm+cWHc4QVyoivlOycHuOUFo4fldfD+3WJYBdBwIknaB8UulpQjUIdoCfkZIDA/TGeCQ0Z16WT+o6hMpBsD5KJweWrxK//Gq8i/jGr83Q+oYxHkjx+xEZClBMg4k+r4nwnaCEN8rkxi2mo7OAePM6R134DP399pThLHv7T5vov8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785916307; c=relaxed/simple;
	bh=zqP+02BC7e75lD3U3x54IU9flle2oj6Dl4ICHvr1YAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oWWnqAQhFhN/Qr4ZnKD5mDpf14fqONcTkZGgUN/olt4YUZw1my9wwpxH1fmCvDyx85wHOUSmW6BiHVuZx1H/7/suYdXM7LQKK8ktBNRhXFyCtE2fyzIEhMvMznN85EhvCS6CeMexo5QGeOdL5K4pp5KwOZJT2FMjmMsvcP+hInA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=e3YK8+bq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="e3YK8+bq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FE231F000E9;
	Wed,  5 Aug 2026 07:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785916305;
	bh=+NLz2icteS0juB+im2vAfxqADOVf42hoW85MV5s2IAI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e3YK8+bq4nBgDdaEUNvfDJk1v3ck91FEkn38bIbe8eLdt9x5uIttO1xOB0HR04HDL
	 LNLM2kG1FlgOton35EFii6h/nvNlDV+PNWfMXJsJ6Ape/DtKERnNN/gSLPH/3IOWTT
	 B7rrY7pwNz+x+DWl23GtRdpo/T1pOfG4ucTiqQsY=
Date: Wed, 5 Aug 2026 09:51:28 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] usb: gadget: f_phonet: fix use-after-free in pn_bind
Message-ID: <2026080509-scouts-nimbly-66a6@gregkh>
References: <2026080515-emblaze-tweak-bb22@gregkh>
 <20260805065703.3230584-1-khiemtranzo532001@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805065703.3230584-1-khiemtranzo532001@gmail.com>

On Wed, Aug 05, 2026 at 02:57:03PM +0800, Nguyen Quang Le Kien wrote:
> On Wed, Aug 05, 2026 at XX:XX, Greg KH wrote:
> > Then you do not know if this fixes the problem or not :(
> 
> I get that. Quick question - is there a way to actually verify this
> short of waiting for syzbot to get a reproducer? I was thinking
> maybe fault injection or something, but not sure if that's the right
> approach here.

I do not know, but step back, why are you trying to fix this issue at
all if you can not reproduce it and you do not have the hardware to test
it for?

thanks,

greg k-h
