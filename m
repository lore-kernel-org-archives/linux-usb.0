Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4A2630
	for <linux-usb@vger.kernel.org>; Mon,  6 Nov 2023 02:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 31629E1
	for <linux-usb@vger.kernel.org>; Sun,  5 Nov 2023 18:10:48 -0800 (PST)
Received: (qmail 934375 invoked by uid 1000); 5 Nov 2023 21:10:47 -0500
Date: Sun, 5 Nov 2023 21:10:47 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Fabian Melzow <fabian.melzow@gmail.com>
Cc: USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: 0bda:b812 USB "3.0" WLAN devices only report a maximum of 480
 Mbps
Message-ID: <61fb4593-c24d-4891-8d44-e2ef819af57d@rowland.harvard.edu>
References: <20231105130215.2b669c8b@ping>
 <2023110540-unseemly-mobilize-9e82@gregkh>
 <20231105134909.6c3f28d1@ping>
 <2023110534-fester-schematic-818a@gregkh>
 <20231105143051.2b28c316@ping>
 <76fc65db-4efe-4da7-a13f-d7a451f836fa@rowland.harvard.edu>
 <20231105163300.3b8df5ad@ping>
 <7738cb40-9ef1-4e8e-8888-b8faadb7ba8a@rowland.harvard.edu>
 <20231105210616.79fea846@ping>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231105210616.79fea846@ping>

On Sun, Nov 05, 2023 at 09:06:16PM +0100, Fabian Melzow wrote:
> Am Sun, 5 Nov 2023 14:16:18 -0500
> schrieb Alan Stern <stern@rowland.harvard.edu>:
> 
> > Have you tried plugging the device into a system running a different
> > OS (Windows or MacOS-X)?  Or even a different Linux system?
> 
> Yes, I also made a short test with the lsusb of an old Debian 11
> Live-DVD. I got these devices for testing from the Amazon Vine program
> and after the third Monday-Hardware WLAN-device with the same problem I
> thought I should report this problem, to maybe help real users.

A test with Windows might be more informative, if you can manage to do 
one.  Perhaps the Windows driver knows how to configure the device to 
run at higher speed.

Also, curiously enough, when I did a web search for reports of problems 
with this chip, the vast majority of messages were about it not working 
with Linux at all because Debian/Ubuntu did not include sufficiently 
up-to-date drivers.  People had to download driver source code from a 
github project and build and install it for themselves in order to get 
the device to function.  They didn't mention what speed it used on the 
USB bus.

Alan Stern
