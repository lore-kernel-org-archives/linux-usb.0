Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795812443;
	b=Vru6KdvQ4qVrYeUTjwZGKPH8s6MA5SSpKx6biNmB4WJjXTpr8rTdoQhdpQxJn04szsJI
	 dDIskzW8JklaGUKLmvdhbyk9wBpWkxQGWIgsaqqe2FqVhLEwlW1bWxZz09ZfTzakKmXnp
	 1iipcpV9hAGXADdjR2DEZvoVLngrSB2f6rfDzxxOVAMdwBmcWVWMfAjNWZ4L92PzdniLD
	 LlRfuYgeiwVB5Ol5R5IsdTypqLaSVGQeY/BOKp6zMCXJ0TgKoLVrFkIz+YQ0k9ZcEHuyA
	 ic7CLXTEY2NQaLi/dK71VSpNLiH4dGErSUETRc4F7UvJ/ZLvvo25t3bw3PqcA6kSzrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795812443;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=dfTwOV4jWgp7mx96Knm64NJRVEkcPDVi4eGrlsn5AoQ=;
	b=uFsu3NZsBMTCtWVoQe/fp32QTn5jL/Cyg94sniNaiXPY9KgeSE9Dau4QssAKAV/RTP4c
	 +8j2k7k0yTh0vWj6d41k5nYCINKR4bgMDD/HPG8c0Tq9Uee9tuHammKd/qX6rqwCOsloN
	 J0WRRiI/yLoefUxwqw3V/4pn1N3qzriFn5RIs+1nAFs2IqLrRaaLLDgCBZBs5Tii6kqnc
	 SlDAPC4IQQApfWPcnAj6izYJv/FSbmL49DFmYfrNQsYPXCeq6/J44xVNs11+ODG7qsY9I
	 VywgfQ3ie2kpdWJTPigm5wA8uWWu8aOQ2FqFLkU9TrZXdF5b80bHaBh6lYxYov4q/Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=JQPV8t+i;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE1B606A31C;
	Fri, 27 Nov 2026 20:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=JQPV8t+i
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4173C1F000C1;
	Fri, 27 Nov 2026 20:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795812442;
	bh=dfTwOV4jWgp7mx96Knm64NJRVEkcPDVi4eGrlsn5AoQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JQPV8t+ihKDmTnWvNYYLz8JLvX1+MNcgjZBUsMev4ey4MbQYhxKinQZY41eg36KvX
	 XWOTSeGOoyNHAtJX6ZXHCczUlaInjiTA8bDm4bBFllJPTixBQVy7qZrmfyh4bk7hSk
	 g+dJ5d0i2NB1B/uteHOhSHpwWsNbbwidU/w4elOE=
Date: Fri, 27 Nov 2026 21:47:20 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: typec: ucsi: Retry if notification enable
 timesout
Message-ID: <2026112733-bobtail-undoing-be7f@gregkh>
References: <mpearson-lenovo@squebb.ca>
 <20261104205654.3518943-1-mpearson-lenovo@squebb.ca>
 <9f5f0a57-dde5-44c9-ade6-96d1b8648ebb@app.fastmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f5f0a57-dde5-44c9-ade6-96d1b8648ebb@app.fastmail.com>

On Fri, Nov 27, 2026 at 03:42:39PM -0500, Mark Pearson wrote:
> On Wed, Nov 4, 2026, at 3:56 PM, Mark Pearson wrote:
> > Found on Thinkpad E14 G8.
> > When UCSI notifications are enabled the FW does not ack the enablement
> > itself. Future commands will be acked correctly.
> >
> > If this happens try enablement again and confirm acks are working
> > correctly.
> >
> > Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> > ---
> > Changes in v2:
> >  - No functional change. Rebased as requested
> >  = Added Heikki's review tag
> >
> >  drivers/usb/typec/ucsi/ucsi.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> > index 5aab8ab9f013..6633ad6658f2 100644
> > --- a/drivers/usb/typec/ucsi/ucsi.c
> > +++ b/drivers/usb/typec/ucsi/ucsi.c
> > @@ -2095,6 +2095,12 @@ static int ucsi_init(struct ucsi *ucsi)
> >  	ntfy = UCSI_ENABLE_NTFY_CMD_COMPLETE | UCSI_ENABLE_NTFY_ERROR;
> >  	command = UCSI_SET_NOTIFICATION_ENABLE | ntfy;
> >  	ret = ucsi_send_command(ucsi, command, NULL, 0);
> > +	/*
> > +	 * Some FW may not ack the notification enable the first time.
> > +	 * If this happens, repeat to confirm it is actually working
> > +	 */
> > +	if (ret == -ETIMEDOUT)
> > +		ret = ucsi_send_command(ucsi, command, NULL, 0);
> >  	if (ret < 0)
> >  		goto err_reset;
> > 
> > -- 
> > 2.43.0
> 
> Can I float this back to the top of the mailing list please. I don't believe any issues have been identified and the initial version was posted back in July. This does fix an issue seen on platforms that are being sold with Linux preloaded and Linux users are using - it's real.
> 
> I can see Dell and HP fixes being pulled in quickly - what am I doing wrong on my side?

I have 1000+ pending USB patches to review/apply still.  Please be
patient for things that are just normal feature additions like this.

thanks,

greg k-h
