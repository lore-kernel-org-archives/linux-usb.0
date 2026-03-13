Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB24236604A
	for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 07:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773385742; cv=none; b=lhyA1X/Er8qRTUeBhL8DRtQ26dUJDKczyc9WP9UmfUZRUQKJl/+HobmFNK+QAv382+FYhiKn8Vi5yi78gH80VH31u9syfI4R/IekibObd4mWCVnBXMmTNQYdBHQafGHWUfPSPk9FSdClf3OqWJITcM3ifJnNh+iU531wBulqpHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773385742; c=relaxed/simple;
	bh=2JmEn35Nt09B4Km6j8epEOo0GxfeT07GF86NKCQ5/+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kbYNad5OZznrreIu5Sh7aPI3QJ4sD1oL+UHeg4DGX4KKmTajj4rMOzaFo6VovwEsGFgMwSfw8AGAk22bLkIjwhSd677pdFswhtnllh4Vk3NHqmDcOdw0zyCQ+yi+YvS9R8HhmlyU2KWl24jtuXTKzRoF1PhDwOrR6fHmbfZZw3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JyIJBBx9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JyIJBBx9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8783C19424;
	Fri, 13 Mar 2026 07:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773385741;
	bh=2JmEn35Nt09B4Km6j8epEOo0GxfeT07GF86NKCQ5/+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JyIJBBx9jBM/Hg4bMPt/2f3mueJlGVEmUR7jgaHr+hJ0Mdzp3c3IpIzBKlfUB7S7m
	 9Hvx7Z8ZAGLHMViQhjKRzh4sUZk5UMotWj2gmWv/GKMDrmLJwu86LWPjovGzS9wiSH
	 7/9uzUjKYnjJrZ/MS3nmmfTWeLBdD5t1ooGq+oKc=
Date: Fri, 13 Mar 2026 08:08:57 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: CaTaTo <vahnenko2003@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: ezcap401 needs USB_QUIRK_NO_BOS to function on 10gbs usb speed
Message-ID: <2026031331-overrun-palpitate-71c4@gregkh>
References: <966898e9-229d-495a-bef1-07ce5d2ad640@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <966898e9-229d-495a-bef1-07ce5d2ad640@gmail.com>

On Thu, Mar 12, 2026 at 09:10:34PM +0300, CaTaTo wrote:
> This is related to https://bugzilla.kernel.org/show_bug.cgi?id=221216, I
> attached changed file, sorry again for this is not actual git patch, I made
> this off repo as an quick test fix, I tried make patch from diff, but it
> wouldn't apply for some reason. I added 2 lines on 596 and 597.

That's odd, did you take a look at the documentation for how to make a
patch?  Take a look at Documentation/process/submitting-patches.rst

thanks,

greg k-h
