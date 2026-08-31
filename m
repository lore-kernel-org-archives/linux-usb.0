Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8F0223DE5
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 01:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788138934; cv=none; b=tEN8OMSfeI9FlATVPUBuE2bprqZ11abaNhrJv5XVA/+0ptmkwpK+/kn551yskdA+WJLR/NzbWJqPDgd6HuSmXz687VVw+IYPRLG0gI0AvNKQ0kJedl96bApRJuK9IdLQHbwscAnT49JLrv/FWVlqpWzJcPyvTxvIeSbwHf6mKjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788138934; c=relaxed/simple;
	bh=ON3K5XgKP7gpRDE7IbiXSTStuvEcMdc7cC0gAPZ0DiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u2cFKFstS8ilUrvUcdKAiM+GewQjw4qv38RbaWO2cnlhk2R7ozNoXziSR3PQKdYS09yfOheBHM/0vT98eTtjU18UYi6gUcBVR0kOU2Yl3eK4P7wbdG81ee6ZAhrUJHs2n2EzCwIifwGFO2m2Hz4D8n/uvE7j3uI82xKwg/erZP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=iOfrV6XZ; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="iOfrV6XZ"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-90cd0e6fd80so22736266d6.0
        for <linux-usb@vger.kernel.org>; Sun, 30 Aug 2026 18:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1788138931; x=1788743731; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M7y1NLVwXUSf08Tsy0vpaiU5Gq6j9SvxOp7x3iNDJJw=;
        b=iOfrV6XZLm2+LHelUrpBUwPlEPq4ag2LNyEZpv5qe6oqZqKj6YXE+ibF4XR737tw70
         se12RMLfxK6vGAFU7WiBXbT9W5Jk9rkQmBJsuI3umMLY9KialMhMvfykFZoSmUqB7qds
         uGzD4Wr8tTMN7BQ6uxsKogbBjWwM1Cr6XN6k7oW2HNzbtytWShQoD1qje5inzFtA2/7u
         PYlCRmp7yepP5wdy3U5X3mJPgItyQEhxecZUstQqlcTM+WNw5P5p/bOjzEbzuwj6MhI2
         SO4bN1AeSK7oe2S99b8xJ9GnIpLC0n87RyD/htzr5XX/qdQqLWmbZSgtaHQ0VXj24YGh
         YKnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788138931; x=1788743731;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M7y1NLVwXUSf08Tsy0vpaiU5Gq6j9SvxOp7x3iNDJJw=;
        b=I9KkFVPMRBYBbieTC9P8Qu3qL5dyznncPRPiHSolLjE0cZr/7CrF752DRMXWHkHjnG
         VrLoxu07BJoLKiglzQyF7QcA9rmfvaDKY08h+1g8F3E33rwnpryAUemQXFrwTv3QIizR
         JQIxOVobsaupI+jmwXbAcYikgXK0M0bq0qb7rou4WvNy0dGjcDSqZq3ByGAWm3gTH497
         GfGGnRZ6aYqjlF6b0K8JoTcN+xRoOi2dXZ2Zy65aAevJ7WxJ/l2uWtVd+DEOdmQcTJe+
         0Ilc1wGzyZB1yMI/AApyYD53X90JZX/l15zBPlas440ozArSDmnBxV4yyLCYLgoSWWl+
         EHow==
X-Forwarded-Encrypted: i=1; AHgh+RrIlSXkJrSlR0p7in1KJ8M989j/XUqDKjM3jjFjxNptA3QTn9LqiFGg6FXOeh654IWY/iydWA0J7ow=@vger.kernel.org
X-Gm-Message-State: AFuF++my7LCA03Z2HwRMKU4+4hOlB6G0eBIA+xOykWeYYOys9gkCaYRW
	h2xKKvjcpQ6suaWqEnsG0Wxa7GgE+9TojD99X2FerDFwKoeNR82pT1IHL8KV68O2uA==
X-Gm-Gg: AR+sD12mUEw94AFKAOtLSXw4Pqfi9qEhddZyMoiChKZtqaT8T2FqH4K34j9W8ntfadH
	Q0ndo08IcwB8up7mvQl2LT630EWSJr6gXOhXpLsDJGKTTBg3a/O7oz3F8kOlzOCEC+tPzWMmCnZ
	iHx/lb13JXyFocIFQPJGObDdSDIGeT9zz69SsPQchIfDDB3RPX63nTiZ6f9uOPid5JhAdQeWJui
	zwMJMVqHJvK6T0LJ8eKJej/eZRDYAXbWzj0I0kn34G5TPqZRB3dy9XRjCR9NWEX6BrAFYkhRIVc
	gxg8E/oLsviIwNaacuhG17xkVUu1zZlnaAA/Xh/F5ic5NS2buIqJQDV6uSAbkvPSGnQT9E5m12N
	FwTtwuCcq82is3vaNB5XXKQ/FdE7Hzwt1jbudeloL0zAwl+WSQpKU/V6YwnXqKrZOlfx80RxD9H
	JChqx31zWRpPbFKXi4Y/oRdma11gqHY9u+1szJylGc649QtiH9x/Z4+Fy4I911Wg==
X-Received: by 2002:a05:620a:8392:b0:938:e23a:2ce9 with SMTP id af79cd13be357-9393fcf9d39mr121937385a.16.1788138930985;
        Sun, 30 Aug 2026 18:15:30 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90ce451513bsm71976996d6.35.2026.08.30.18.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 18:15:30 -0700 (PDT)
Date: Sun, 30 Aug 2026 21:15:27 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Linus Walleij <linusw@kernel.org>
Cc: Daniel Palmer <daniel@thingy.jp>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] usb: ehci: support controllers with non-standard
 registers
Message-ID: <fef8be63-ab17-475a-a77a-4dc874d1a704@rowland.harvard.edu>
References: <20260831-gemini-usb-fotg2-v1-0-8a8ee12c4b32@kernel.org>
 <20260831-gemini-usb-fotg2-v1-1-8a8ee12c4b32@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831-gemini-usb-fotg2-v1-1-8a8ee12c4b32@kernel.org>

On Mon, Aug 31, 2026 at 12:24:19AM +0200, Linus Walleij wrote:
> The Faraday FOTG210 EHCI implementation moves PORTSC, omits
> CONFIGFLAG and USBMODE, and needs controller-specific speed and reset
> handling. Add
> per-controller hooks for those variations while preserving the standard
> register path for existing drivers.
> 
> Also allow a controller to reject full/low-speed isochronous transfers
> when its integrated transaction translator cannot schedule siTDs.
> 
> Assisted-by: LLM

Which LLM?  Or is that the actual name?

> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---

This is a pretty unwieldy patch, which makes it a little difficult to
review.  Can you split it into, say, three parts?  Such as: one for
the port status register change, one for the port reset and speed change,
and one for everything else?

Overall it looks okay; it's just hard to check the details.

Alan Stern
