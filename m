Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2148D393DCA;
	Fri,  8 May 2026 15:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778253555; cv=none; b=Nj5U3CVFNWrjLlC1EjaCDUNQrb05sTPN4XaY5diGR2qayHpq7iBPumisxvW842+ud6oW7P/G0qK/u+alWv77dQTiR++IJ6GOnX98HRLrgNRbeFSc4mGf2bEpmqx1Rp1SQtIjAN95q0jd0wusYHpJPabVCSRJUbl0WkGK5Fd+YNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778253555; c=relaxed/simple;
	bh=Aa+aa2AqRMthgYGNMF3lxwCnMkSBG34Y6SKbAy3Ff4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HS61G5WPTOC0OYwkfHmTYPtYzzvfWYwssmsP5vZNGgEg3PbKKD9IWn2KOWN+mRCk8T497GKofX3oje15HZPX6640AtLwmUqXoo0NKp8WqekJq0XFeMkixiMPYd6CJD+o0CkCN8r6ulfOBrlCeIiY08jo8LKp1VKR0SautnnluIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ArtyPQu6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ArtyPQu6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0E36C2BCB0;
	Fri,  8 May 2026 15:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778253554;
	bh=Aa+aa2AqRMthgYGNMF3lxwCnMkSBG34Y6SKbAy3Ff4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ArtyPQu65FpZd8BlUbA0laJLsmgGiXc/phZy89iwD3G/XYARPi3VgJjTPyJsIPjkE
	 uKqpS9n75gaoQ071Kjs0+cjHrHKNrRRf5VvsxBbcdFLAf6bGPnN87xfXL/9xdDJo1l
	 WGaswB2G6u2c1kow/5pqRJEaXBt+n210JEucdrL0=
Date: Fri, 8 May 2026 17:19:11 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] USB serial device ids for 7.1-rc3
Message-ID: <2026050857-vanquish-repressed-2b89@gregkh>
References: <af2FMwA6olGEgjWu@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af2FMwA6olGEgjWu@hovoldconsulting.com>

On Fri, May 08, 2026 at 08:39:47AM +0200, Johan Hovold wrote:
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-7.1-rc3

Pulled and pushed out, thanks.

greg k-h
