Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3723E25B0A4;
	Sun, 12 Jul 2026 07:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783839639; cv=none; b=t3rKEM+K8hNgQz8NYeeVufwORaTkCogiwBk1OCXE880U1n4EG8mN7gn7NdyuPnK/0i4sSHcPVGs2JUAZSxiTQYiBKug7bAWu/wF76BfVDB2dkn8O0fFxlq4/HYxxB+jaH3rlJYoxdTH8GuF9zABQ1+3Nk8pBSEDu97OvRSIA9LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783839639; c=relaxed/simple;
	bh=NCf9rVJoR9dwSHanVPIFzPjC/ccSeLegEUcGMmDLvMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jg61DrJ/NDYC8nBMFN0hYjyzGaWfKMIQHZdDlhL8gXvUFNKCOH9ZnuA4zAeLOAoyb6gCtYcus9tBdMsmAQvzhZWp4UMd+7m25805GamCpjaF0PIEXPPD3zQUemq4sQtCNJLUuVCccm9CodTy1MLePhgMmdrKFzkW/GyfJ/dirXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=2Q4rMe8S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2Q4rMe8S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 726C21F000E9;
	Sun, 12 Jul 2026 07:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783839637;
	bh=lebT58SlphwKhb0kcG9L3Fm/030I+K+DMzlF9PEGpPE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=2Q4rMe8SdU6bC31/S2wH2QMmX4MgljL+vUySyG6Zv1qVBiShAX1aqzysc4dBcWxrX
	 1c+WxY+se8CKl5iEIeJfdBs+fbE3uuENHvPnAX21Bn4P6oYRh3hBaExpbJiEanZKeh
	 ltP2iVemuuNDFf2eEi2MoADIdLfQm+kfaJY7Kwx4=
Date: Sun, 12 Jul 2026 08:59:19 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Keshav Verma <iganschel@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Question about patches for usb/c67x00
Message-ID: <2026071233-decorated-catwalk-7c0d@gregkh>
References: <CAPE_3zK2XtehxUKiYfsfbVWMa8gHAXq8p+ptm9Cjoi+gjEkKdg@mail.gmail.com>
 <CAPE_3z+aWAPt0qrHmy_A3dLaovT+RY6F1iWhTYwGiNJWZHchHA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPE_3z+aWAPt0qrHmy_A3dLaovT+RY6F1iWhTYwGiNJWZHchHA@mail.gmail.com>

On Sat, Jul 11, 2026 at 10:54:44PM +0530, Keshav Verma wrote:
> sorry about the HTML mail.
> 
> re: Question about patches for usb/c67x00
> 
> Hey,
> 
> I was looking around at Cypress related usb drivers and came across
> usb/c67x00. I noticed the driver is currently orphaned, so I wasn't
> sure if there was anyone else I should be CC'ing.

Just who ever is listed in scripts/get_maintainer.pl

> Since it's fairly old and doesn't seem to be much active, I wanted to
> ask whether you'd still be intrested in patches for things like error
> handling and code refactoring.

Do you have this hardware?  If so, then yes, that would be great as you
can test the changes.  If not, then I wouldn't worry about it.

thanks,

greg k-h
