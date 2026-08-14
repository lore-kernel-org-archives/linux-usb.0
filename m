Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29462E7165;
	Fri, 14 Aug 2026 01:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786670881; cv=none; b=amAv2+mY8zsvLipWJt3zbLiWBjjzZW1aUReX9B+qDgkFKn7UUIQr80VXVdfFD3SbigOIrU0a+dznU65YqD2xLqp+NUwm/TJo0AD1XLde00pB6ytcSn3sda1WJ+LyWokXaBp8OtshxBd528W+JusdHiX2E0IBUL/49H4gTqX7MQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786670881; c=relaxed/simple;
	bh=Sp9SpJPeJqaIsWufn8ZIQFd5xXrDlUBpmARcGKHkTSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p2lbBx+lNis43DMmPmpQ3Q6VSOghXZLP92HQ//dvoYCyb0yD5ZdZwotcsED2DANHs+awCKX1jjpqG5X/6TJdXQ+j9JAv2cx40vKopENJZZ8j2nbQU0U2sPHpOjULeHRyttArx64NqQ8o3VZVuM0ppeZ2cb/5pze2kFpRcHa/tOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=E5ROsZ7o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="E5ROsZ7o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F0081F000E9;
	Fri, 14 Aug 2026 01:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1786670879;
	bh=vW8DXwcTD9oXhfOIkGo4d6oWgVYIMv2TAMxsFwRD1C4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E5ROsZ7o/+I7VaJH4+IWhXNmrY8vbLolnDn8PKi68SUNZ8IKPfcjlRK7K5D+kZwMk
	 a0miIurebEDbq3Hfl7uImUT0ne35n2os41BADu4znNxye9wxRIO+7SZr2FWB5MVbJK
	 SMmWT9oLuWIm7Xli3Nkj5Dbsz17HBSy5rfa5YAWk=
Date: Fri, 14 Aug 2026 10:25:43 +0900
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] USB serial updates for 7.3-rc1
Message-ID: <2026081436-trade-proud-a8b5@gregkh>
References: <anx9DSOtHC_Eq7LB@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anx9DSOtHC_Eq7LB@hovoldconsulting.com>

On Wed, Aug 12, 2026 at 04:02:53PM +0200, Johan Hovold wrote:
> The following changes since commit a13c140cc289c0b7b3770bce5b3ad42ab35074aa:
> 
>   Linux 7.2-rc3 (2026-07-12 14:16:39 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-7.3-rc1

Pulled and pushed out, thanks.

greg k-h
