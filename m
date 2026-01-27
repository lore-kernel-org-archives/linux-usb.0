Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DDC278E63
	for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 11:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769511850; cv=none; b=iVDGASfew9wVwmaYbeN/qSFmsP0Tio7wAwqAmNi3B9708AWVeLQRAgyMk79IFsS7GluKk9q7ISeo7jH/TLbSsTrC5xhzb73/yCZFpgsC5+gpSibB9oO4CWDTnlGMaL55qQJ5Yt2k74+IZ/GL6zbAVkY5yDtk5fBSsnW9qtpXj/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769511850; c=relaxed/simple;
	bh=lgvtX/zj3MJxRsv9KlaS/B3CC9158fDekQSsmBDkyZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ArJnVrAJQ+wR7KwBEG9tu3gTNpWtVWbjjZmdqBEST8b/hL6BpMadarV1nAkmUJ7Nh9FaAMaqSyilB7DzB102xKWpVGh8/fSPKgsIKhszPZOHQ1s7yGcG5w4zbZAk+hbg9+gIb6jlL8N+D0eooSN+s1RKHStLSp8k72fc0JJQKOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=w8evPu/n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="w8evPu/n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E48CCC116C6;
	Tue, 27 Jan 2026 11:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769511849;
	bh=lgvtX/zj3MJxRsv9KlaS/B3CC9158fDekQSsmBDkyZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=w8evPu/n6Wul5BpOR5PXDS/LqnQJLB9sYyhjaH7/Gt7wHITvv25gcCTRELumjJpEm
	 L4L0V8HOcYCokOKI2A5gaFY2sSUeuf65NsY0fTefNZ4di7s16G+YVndNPVnmBOb9CY
	 5toBUJsBW91L2Kjhe6P3Ttzv7cBigmOkesJxM6Wg=
Date: Tue, 27 Jan 2026 12:04:06 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: raoxu <raoxu@uniontech.com>
Cc: kenny@panix.com, linux-usb@vger.kernel.org,
	mathias.nyman@linux.intel.com, michal.pecio@gmail.com,
	niklas.neronin@linux.intel.com, zhanjun@uniontech.com
Subject: Re: [PATCH v11 2/2] usb: xhci: enable secondary interrupters and
 route transfers per slot
Message-ID: <2026012720-uplifted-mustiness-f12c@gregkh>
References: <2026012754-ferocity-operator-e3b2@gregkh>
 <B1C5B74BDE1826C9+20260127105522.3628982-1-raoxu@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <B1C5B74BDE1826C9+20260127105522.3628982-1-raoxu@uniontech.com>

On Tue, Jan 27, 2026 at 06:55:22PM +0800, raoxu wrote:
> Hi greg,
> 
> Thanks for the review. Below is why I believe enabling secondary
> interrupters is justified.

Sorry, but always properly quote emails.  I have no context here.
Remember, some of us get over 1000 emails a day to review and handle.

Please respond with in-line comments as is recommended and I will be
glad to reply.

thanks,

greg k-h
