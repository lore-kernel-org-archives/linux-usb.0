Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B835240D573;
	Sun, 14 Jun 2026 03:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781408495; cv=none; b=CYYwVJLQMVPqDBpvqCeAd0LXO0InFwt+NTuL4gYXI02Xnn8+3kHldKBT4sdQMsOaZAvdBjOj7YKoaZbdVng5e7WAIK8jtFot16tDvt8biqP/szm97q3fLernz73okxfP6tbDuFqa/88e2TWaKmOK65AoI2K6P1hA9EC7Vf+FWH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781408495; c=relaxed/simple;
	bh=nsBELx7PpNsyxouSq7cHa7ygz2JhBqoKFYp6usPIKY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lGv5xCImCTqFqNgvaS0u5ryw9b2fZ5AaOzCNWkbTcoHmJ3i6US9qNuDDIQM+eaIoTZfrJWV84ADtYgXA1DXd9rq7E1tC4gzpfVSbRsFvp3kQQRsiUl7B+y938ezOj04sq/6obqYCfAxG1SMj0JO23vVBd4WpUo/JPyEkOsGFpBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TWZbnFhq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TWZbnFhq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B05281F000E9;
	Sun, 14 Jun 2026 03:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781408494;
	bh=nsBELx7PpNsyxouSq7cHa7ygz2JhBqoKFYp6usPIKY8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TWZbnFhqJJDvmKti5mvugVockRkLv7jOETq81eTAvbgWHgV95O1c8iC+R8H3fVrAH
	 5On/ahO4fVUxYJHbGig01511zedvg/18g/pspVzEGp7IH45MtfI+a89U85IQpXfBMp
	 4Zjf+6LrkxjUSAHtR9VZn8ly7RShYL9UZ5NNx9zE=
Date: Sun, 14 Jun 2026 05:40:33 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-usb@vger.kernel.org, Bastien Nocera <hadess@hadess.net>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: apple-mfi-fastcharge: Convert to devm resources
Message-ID: <2026061403-lion-pregnant-b6e3@gregkh>
References: <20260613201851.63191-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260613201851.63191-1-rosenp@gmail.com>

On Sat, Jun 13, 2026 at 01:18:51PM -0700, Rosen Penev wrote:
> Use devm_kzalloc(), devm_kasprintf(), and devm_power_supply_register()
> to let the driver core handle resource cleanup. This allows removing
> the mfi_fc_disconnect() function and the error labels in probe.

Please don't do this on old drivers unless you have the hardware to test
that the change worked properly.

> Also take the opportunity to shrink the private struct and move the
> variables in probe as devm doesn't need them in the struct.

Shouldn't this be a separate change?

thanks,

greg k-h
