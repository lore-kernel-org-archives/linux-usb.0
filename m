Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D057063C3
	for <linux-usb@vger.kernel.org>; Fri, 20 Oct 2023 05:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="W5fb2/+w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1446C433C7;
	Fri, 20 Oct 2023 05:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697781219;
	bh=5H6AkLY3cuSxz+5a35NJwToZCCQZU07uOZ4SXH046HY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W5fb2/+wglgG+GujFpFY+Fr3eULWoMihOFvMwEgOXOZXMm1YWOAgfVOK2B4zwW/UR
	 zAcU32NNhq2rUc4DuuFuYKvlZssG4HFHZeZetUX3f6x/7qXgCDZ1rHDxEdo+e/OVqN
	 y57MjX41wxUz2GrwvdnqQEbhvzlzHa0CRBKLp6qI=
Date: Fri, 20 Oct 2023 07:53:36 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] USB-serial device ids for 6.6-rc7
Message-ID: <2023102029-channel-woven-6e61@gregkh>
References: <ZTFC1jhZ0m5PIMRE@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZTFC1jhZ0m5PIMRE@hovoldconsulting.com>

On Thu, Oct 19, 2023 at 04:53:10PM +0200, Johan Hovold wrote:
> The following changes since commit 8a749fd1a8720d4619c91c8b6e7528c0a355c0aa:
> 
>   Linux 6.6-rc4 (2023-10-01 14:15:13 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-6.6-rc7

Pulled and pushed out, thanks.

greg k-h
