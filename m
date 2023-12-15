Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id B3AEE18EAE
	for <linux-usb@vger.kernel.org>; Fri, 15 Dec 2023 22:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 288613 invoked by uid 1000); 15 Dec 2023 17:46:24 -0500
Date: Fri, 15 Dec 2023 17:46:24 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Yinghua Yang <yinghua.yang@motorolasolutions.com>
Cc: gregkh@linuxfoundation.org, zachary.zuzzio@motorolasolutions.com,
  Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
  Oliver Neukum <oneukum@suse.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
  Wentong Wu <wentong.wu@intel.com>,
  Sakari Ailus <sakari.ailus@linux.intel.com>, linux-kernel@vger.kernel.org,
  linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: misc: Add driver for Motorola Solutions security
 accessories
Message-ID: <26c70a69-f18f-4c82-a520-7943be0e1961@rowland.harvard.edu>
References: <20231215211218.2313996-1-Yinghua.Yang@motorolasolutions.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231215211218.2313996-1-Yinghua.Yang@motorolasolutions.com>

On Fri, Dec 15, 2023 at 03:12:10PM -0600, Yinghua Yang wrote:
> New USB driver that sets power/control to autosuspend for Motorola
> Solutions security accessories. The new driver only changes the power
> control for specific USB devices, normal read/write/ioctl of the usb
> device uses the unmodified usbfs.
> 
> The rationale for a vendor specific driver was to allow for autosuspend
> behavior on Linux installations that are battery powered and do not
> allow user modifications to udev settings (e.g. embedded Linux, Android,
> etc.). The idealistic generic approach that would allow any USB device
> that supports autosuspend to change the power control could not be found
> without a change to the USB standard or substantial change to the usbfs
> architecture.
> 
> Signed-off-by: Yinghua Yang <Yinghua.Yang@motorolasolutions.com>
> ---

It seems silly to write a kernel driver for this.  Isn't there any way
to handle it in userspace?  All you would need is a simple shell
script.

Alan Stern
