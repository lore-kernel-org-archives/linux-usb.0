Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95804325485;
	Sat, 11 Apr 2026 09:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775901558; cv=none; b=UYYh1CmZsfHowUa7wTWZi77mCv6X+QeteLnqRaGfOjJaz1MZvXkomr5KEPmNBgOCjBu7I9j1q61e3IyrEayw09piK8Rbf93FAoRRFK97E14uFFtGt2r6IzZAO7rfgYvTOUH1qJ1fjC7SSzkb0TZvS9tcyFd1x2IIcR17yMmckUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775901558; c=relaxed/simple;
	bh=zP2owB5pVkEYOIDQErZ3WD4GsKuKREjo/bdUBb+68Fs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kwq7xL9y8cqlu2HotcBk/HHUg+Xd2RnuYE3k6pK6KFPtdU9IsOm3TP151QgCjDpeAlLi2RkPIi1QyYEzo81cdwc8BQrXX9nRdBrTe0hwU/KXYUaApV4ZL/BSJO3au5n2ZgGaOX6t7LllBl01O33qtJvKbWVj33amIaxaNlvn7q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jMWTORNx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jMWTORNx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8A1FC4CEF7;
	Sat, 11 Apr 2026 09:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775901558;
	bh=zP2owB5pVkEYOIDQErZ3WD4GsKuKREjo/bdUBb+68Fs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jMWTORNxFRSTwXPVRbKJJYUQVsijs9wQnBUNoRKuB8Vl72m83Z1oMGx3mG9D5PbGR
	 WtQ253L88sJRA1iZK/FZqrRT/gt5tyfL7jm/RBzcqtFMJEL1OopDAmdBX6AAgaSg0J
	 NTUkK1uAlkpUx7xthLh6FFbogaqKnWPTVZufanB8=
Date: Sat, 11 Apr 2026 11:59:07 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] USB serial updates for 7.1-rc1
Message-ID: <2026041159-schematic-enamel-ca82@gregkh>
References: <adjwpTq07DQKRqD2@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adjwpTq07DQKRqD2@hovoldconsulting.com>

On Fri, Apr 10, 2026 at 02:44:21PM +0200, Johan Hovold wrote:
> The following changes since commit f338e77383789c0cae23ca3d48adcc5e9e137e3c:
> 
>   Linux 7.0-rc4 (2026-03-15 13:52:05 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-7.1-rc1

Pulled and pushed out, thanks.

greg k-h
