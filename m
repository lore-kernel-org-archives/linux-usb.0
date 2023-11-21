Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21101389
	for <linux-usb@vger.kernel.org>; Tue, 21 Nov 2023 14:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ExxxlYa4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8523CC433C8;
	Tue, 21 Nov 2023 14:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700578228;
	bh=Mom/uC6Xa4g03z0XsCPWTrFvQs4pu4XVYH3eMVVBFXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ExxxlYa4duwMtmfWUxhC74eaNFQJyb7g22u6RspUvKR1ddyylNPwyyZRolCAuiyp2
	 C7jvQH2KCmnE2O4EmSm4Lt1qD/UKCFGhH0G6VyexoGJ8aPjrGjv6B7C/OBCnKzOXWK
	 PdGhTURi+pP5Jaqcl1yfyC/z5rOeLLvBxhRr76Eg=
Date: Tue, 21 Nov 2023 15:05:26 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Wentong Wu <wentong.wu@intel.com>, Oliver Neukum <oneukum@suse.com>,
	linux-usb@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] usb: misc: ljca: Fix enumeration error on Dell
 Latitude 9420
Message-ID: <2023112109-talon-atrocious-ad46@gregkh>
References: <20231104175104.38786-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231104175104.38786-1-hdegoede@redhat.com>

On Sat, Nov 04, 2023 at 06:51:04PM +0100, Hans de Goede wrote:
> Not all LJCA chips implement SPI and on chips without SPI reading
> the SPI descriptors will timeout.
> 
> On laptop models like the Dell Latitude 9420, this is expected behavior
> and not an error.
> 
> Modify the driver to continue without instantiating a SPI auxbus child,
> instead of failing to probe() the whole LJCA chip.
> 
> Fixes: 54f225fa5b58 ("usb: Add support for Intel LJCA device")

That commit id isn't in Linus's tree, are you sure it's correct?

thanks,

greg k-h
