Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4277E481FD6
	for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 18:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784055575; cv=none; b=Ck1xTNMCKeLrvYwK2ExcY5/vOl/ZnZwKbUvdboFOJ/PUhd1IaGBkoA8OsjbHmKnA+03WN8yeUrsdKmtbMqgiC9BkHM0rep0qVcwl5EfiwdUTvkP+qVDPNPA2xq7AMEwinA7YxSnLEr8CEO6v4Ms8DkJzrXV99ZwIZeCmzlxXlGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784055575; c=relaxed/simple;
	bh=IXq0FAAc78TyoGp8uuzsKGSHedyyXLGyo6ddmHn1t0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YZmzOsM+Zi2n/jFAMiqKETEzbLNFsX+KirqHNr0WkfNsLw8Rrx9lRF3iPRMop2wOt9ioEFMXLjKpdcBT7B+YLwKTjUlsc2r/8/7T9OkD4aiG9FM5KIz4R9c7ysbI9FVml9lci2G0pxgPRv+J8Ee+7YV+kJ8xN582hbW9+4aAEU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Ow3NhSXa; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Ow3NhSXa"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-92e5cb052edso109603985a.2
        for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 11:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1784055572; x=1784660372; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wxrPhgZ0OOHJaTMRlc00Cx8sHx2fcggJ803FMg34cxY=;
        b=Ow3NhSXajijAQQObnCRu7MM0BDy5J8W0miJUaXmxeYEdAf3SoxXG94/iMv43IV6D7+
         rU2+hngDfkfzp1phMfGenZTi/0aGZT5WyRBbuy6s2fJE17fQ4WcAcmH+Ue3Ovf7Ve4Rq
         B3Kc1rIR7jgc/ANTbZ2KsW68IqL5y7jvUDznWSRsHEhq6xI1zc5L+LrdVlCzgpMSQ03x
         OgeyqlCpmeOg2uuyji+Wb70t0jkWTiZRP24ptFy8WmQxciHWzSCIl3qaXuA2PvYdYWFS
         PJ6C229PxH2Qs6U1mQvhUwCaFQUUJpGi+75AgD3YNUgaZdxj4wmly1XCsWp7fzNmH3zf
         PDtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784055572; x=1784660372;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wxrPhgZ0OOHJaTMRlc00Cx8sHx2fcggJ803FMg34cxY=;
        b=ZqBRdDs7aF87PkhnkuQbhb/Js4hsbBFv9FjMBvbAUS9SzWLwR7HkLQfzvFfWwgzvCR
         NfEd9OmEXn0nAoB0dmk86dVHBcr+HIKrDOz2NQC4F2NVPdOkQHrCJ34dJ3MDkVzPhn6T
         9Jc9JaxCT24RbvoWv1ieL3ff3T4DW6KzrwE7AHSVPkrfrXuHoxngXq91OdiN2cK+/yQl
         P/HjgvglNXbZTsibkYAIpcxAf6VtqXjXTvGtIHZmg5Z/M+MFQN7fB1T5dq2AQ0K9HuJ9
         ZHafz75SYgHGvdskJ6Wk5KL0j9XONQBIp2vdNCXL2jkCYtVi/gcYu1paU92ax3/vWWlR
         BVcg==
X-Forwarded-Encrypted: i=1; AHgh+Ro+Vf9t0WT24wIyQFVXsu8t40rcVdRPDF+7caOGDrNe1RODVPeo1/IvP6IHEuPfbTQMg+HyPCd14L8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoffoJ1T5QrTbqp8FcpIK0sBu2WqKnxrwtVNy27yfQGDj79q9W
	uWqG7tuCATksZmVv7VrhH4yBzpu5redDZM50/dI2P6kJQ5uMHgc2iHdX6o7mPUy9nLAiMpxIiez
	FVfcbTw==
X-Gm-Gg: AfdE7cktuDHKyDnzXM3hoU7jL7SSk/3sTh3X7981OuVL+0tsWipSZFEZ7ub30mQc9gb
	PzEGak8GSS59nAfzRMCxNX9Q3tS+9+t0JkYNID25w1+9oyyi6/uenonCpL9YpBnbyCQtMz6KIv/
	FKHOLzB89MFLP6PUKu0q0L8zg2WpMSTl+494LydQTurTZgjJlnfXjYiRUulJ6HuqkLtaSd+hRZa
	46s08JOna2icUsEBcp8/j0jvmk4+2KN0ESKEUCWaahdOQ4YJ1LG+u819T8Fcs6xn4SasqJ/YZff
	7u9B7ZvIOB6yVbCYW7grfQSs0CmQoHyt2fSTRtwe+9zYbn90PXs1p6irlHR3angJT15gRW6QILs
	kYpTSijbLWXvK2rGKd6ePsuMvKZCjjN+jBxmsOTP0Ffpi4rbEn+Yk0jdqXD6Axnq9KnMkMfhuF4
	doY6TLuWJ7EyVOskVdvD0CTAn5
X-Received: by 2002:a05:620a:2713:b0:92e:c28c:9dff with SMTP id af79cd13be357-92ef2aebfebmr1620216185a.6.1784055572021;
        Tue, 14 Jul 2026 11:59:32 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::883a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5b8eebbsm1553938085a.17.2026.07.14.11.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 11:59:31 -0700 (PDT)
Date: Tue, 14 Jul 2026 14:59:29 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: Griffin Kroah-Hartman <griffin@kroah.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: core: Strengthen error handling in hub_hub_status()
Message-ID: <d5475154-d8cb-4352-a1ee-b2f0c6ec4da5@rowland.harvard.edu>
References: <20260714-usb_core_patches_2-v1-1-4229a368a633@kroah.com>
 <f66a5507-5e83-424f-9c11-15b1882be499@rowland.harvard.edu>
 <f5e4f3d4-34f8-46b9-90e2-4f21e90983b7@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5e4f3d4-34f8-46b9-90e2-4f21e90983b7@suse.com>

On Tue, Jul 14, 2026 at 07:48:14PM +0200, Oliver Neukum wrote:
> On 14.07.26 18:32, Alan Stern wrote:
> 
> > > diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> > > index 5262e11c12cd..0d2166b8923a 100644
> > > --- a/drivers/usb/core/hub.c
> > > +++ b/drivers/usb/core/hub.c
> > > @@ -991,10 +991,12 @@ static int hub_hub_status(struct usb_hub *hub,
> > >   	mutex_lock(&hub->status_mutex);
> > >   	ret = get_hub_status(hub->hdev, &hub->status->hub);
> > > -	if (ret < 0) {
> > > +	if (ret < sizeof(hub->status->hub)) {
> > >   		if (ret != -ENODEV)
> > >   			dev_err(hub->intfdev,
> > >   				"%s failed (err = %d)\n", __func__, ret);
> > > +		if (ret >= 0)
> > > +			ret = -EIO;
> > 
> > It would be better to put these two lines above the preceding test.
> > That way it won't print confusing things like "hub_hub_status failed
> > (err = 2)".
> I am afraid I have to disagree. We would in effect say that get_hub_status()
> has returned -EIO. That is simply not true.

On the contrary: The message would say that hub_hub_status is returning 
-EIO, which _is_ true.

Of course, the error message could instead be changed in the way you 
suggest:

				dev_err(hub->intfev,
					"get_hub_status failed (%d)\n", ret);

Either my change or yours would be okay with me, but I don't like what 
the patch does.

(Another question is whether this message deserves to be dev_err().  
There isn't anything the user can do about it when it happens, so maybe 
it should be dev_dbg() instead.)

Alan Stern
