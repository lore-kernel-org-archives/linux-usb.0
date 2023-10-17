Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D85F2D030
	for <linux-usb@vger.kernel.org>; Tue, 17 Oct 2023 17:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="i8us8Yl2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63FEDC433C8;
	Tue, 17 Oct 2023 17:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697563720;
	bh=n9GgMaAhc+WehenrjFhFyTf0dO39GP2+2d1v7Jx9iUs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i8us8Yl2huPsfjsXonzenU49R602LRyEVX+Bj5T7uJgZOP7OTJoDTUuTeXZMrjiVV
	 L8C7gWC3oLEtT5t5FZigFOnFk8F2MwrDGEYbovyCoZpkA31TevOKAtiwnNpexkir5G
	 F8M+Oz4ypAb/Atx7Phbj+LyM9SHAuKegv2DTamSM=
Date: Tue, 17 Oct 2023 19:28:38 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Subject: Re: USB4/Thunderbolt fix for v6.6-rc7
Message-ID: <2023101716-magenta-almighty-281d@gregkh>
References: <20231017141447.GX3208943@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231017141447.GX3208943@black.fi.intel.com>

On Tue, Oct 17, 2023 at 05:14:47PM +0300, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit 8a749fd1a8720d4619c91c8b6e7528c0a355c0aa:
> 
>   Linux 6.6-rc4 (2023-10-01 14:15:13 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.6-rc7

Nit, you forgot the [GIT PULL] prefix in the subject line.

Anyway, pulled and pushed out, thanks!

greg k-h
