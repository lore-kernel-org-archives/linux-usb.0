Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id F2765112
	for <linux-usb@vger.kernel.org>; Thu, 30 Nov 2023 12:59:38 -0800 (PST)
Received: (qmail 262753 invoked by uid 1000); 30 Nov 2023 15:59:38 -0500
Date: Thu, 30 Nov 2023 15:59:38 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [RFC] USB: check for transmissible packet sizes when matching
 endpoints
Message-ID: <bdb48037-5c59-4791-9a2a-9d51ad9c677b@rowland.harvard.edu>
References: <20231130114006.31760-1-oneukum@suse.com>
 <dff34e08-446e-49cc-944f-7b2c50908095@rowland.harvard.edu>
 <96735459-e1b6-492c-9759-70c97ae52f3d@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <96735459-e1b6-492c-9759-70c97ae52f3d@suse.com>

On Thu, Nov 30, 2023 at 07:22:24PM +0100, Oliver Neukum wrote:
> On 30.11.23 17:52, Alan Stern wrote:
> 
> > Why would a bulk endpoint descriptor's maxpacket size ever be 0?  Are
> 
> Because evil people connect evil devices to nice computers.
> 
> > there any devices that have such a thing?
> > 
> > If we do encounter one, it will trigger a dev_notice() in config.c's
> > usb_parse_endpoint().
> 
> Yes, but that does not change what drivers will do when they
> try to use the endpoint.

In theory, it _is_ possible to use an endpoint whose maxpacket value is 
0.  All you can do with it is transfer zero-length packets -- but 
somebody might want to do just that.

On the other hand, the USB-2 spec (section 5.8.3) does say that the only 
valid sizes for bulk-endpoint maxpacket values are 8, 16, 32, 64, and 
512, depending on the speed (add 1024 for USB-3).  We do accept other 
sizes, but perhaps we should rule out size 0.  The right place to do 
this is in usb_parse_endpoint().

Oddly enough, the spec does allow the maxpacket size for interrupt 
endpoints to be 0 (section 5.7.3).  usb_submit_urb() should check for 
this case and fail a submission if the transfer_length != 0.

Regardless, the endpoint-matching routines are not the right place for 
these checks.

Alan Stern
