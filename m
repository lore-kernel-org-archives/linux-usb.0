Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795014693;
	b=c5iHBp/fwvrYTQSzOyGos5ECxhGvNRNUjoTk9w4iSL+5//ot26v5qzIIeSUBLXbLwa8I
	 vJkl+fBY3TNYyo9+1Q15euoO9yfydj/Gm3oCAw4hxIv6QPrQ69f8+Otc8TMbXNvamTrYI
	 sHHpG4zAo6OcRH4sX2Oige5efHTtnhIsCxptTtzXJafmfkucRWFjI4vfdLJxh7/f4Joq1
	 vdBJGoeGMxN9m4sVw8pfG64xJhruY6DKrpOeh04NP1mx9f/1ViVdkPv4ruLqxuVTl0b02
	 2yFylDDpcTpvCKJagTnfcqMeygdEhTVuEyu1yFeOAtltwqTNqRxxTRxz8XN2GkwDRcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795014693;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=3dbc9FtYFsNBAQJTQDYXrpm1FEVXqiaNfFhkTK5fcB4=;
	b=PaMOop/mwVcW05To26Zym9DCqZtKzhgCO92iLHUEDL9v1SJyGbhIZZwEbqnC42RhiSrd
	 xzdCN/wLaB3qKGIBTlKnPMkGyMw0HnkBzoS1MVXJSUR81D75jd9f/rkSrX6rI7km/+r1s
	 Ytk90gBeRgd7I6iQO8gpyAtYK7KkhrNhH4zVpIIZ+h/Z+UMFzLb1inOkeUZYP5G4Bgqat
	 iHRkMdT6bpVJBNRlpjf+XPEGglqdBXx5M7EedHN2ZI3Jzp6flkSqM75f6WHXnZlERj+Bv
	 msqcbB/IeLXqJ0nG5h9E6Hsr4jXemL3ATX5+4Fk23lycPBJHDYdaGvhxsgtA8qwWZLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=YLLmwUoP;
	arc=none smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8A7606A31C
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 15:11:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A8A7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=YLLmwUoP
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5364648ae07so12366421cf.1
        for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 07:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1795014691; x=1795619491; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3dbc9FtYFsNBAQJTQDYXrpm1FEVXqiaNfFhkTK5fcB4=;
        b=YLLmwUoPDrLpCT45kIwK7Z77E7yysow9q9O5x0Bb+NxtiS/EcVBIgUUFPgr3Ixv4Ro
         7pmKkpBXG0nEf110i7L86xIebwhOr9fYgLIvwS8UTvbikT9UTjOCG2b3kf9q0MKITC+2
         fWkhYmGMkeV4GqqQGtfusTv9OU1d7Pq3f1DSGSDJBSpuXSr8A7uSgrjyalEm9Y0qfMiE
         h0qdilZHSmDzOZKAswOd2DfFakf18goK0rar9X+AWnNfD3QzyK7bfEbTzKMpWBxaf7lS
         dzlbDtxWLwUsdfSyWi7WU6BBecODgBnQQq8JBgJ3vcRdkZY9LHQ+IZUycb2m4GfuC/bL
         Dl/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795014691; x=1795619491;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3dbc9FtYFsNBAQJTQDYXrpm1FEVXqiaNfFhkTK5fcB4=;
        b=azFB+xDNZvOMwifNPSfg83jhxRbUCtHCSifPY8wGC8EHjaLRkbDNbbhb77L5fKSSEf
         cnF6IzKWvB1Qhs+gEz/0Eb/7cnvumdGuPXw/bNu4KKan2ScmftQEextYBTsjYPfl3O/V
         fTjf6b5eEqtom4PSiXQlRXPo4GGkXRxgkS4KOjP+VgYI2NjHURyLO5vmWOUm9XWp8AFc
         lva9qyhzBZgJlIJVef0I1xkauRuQYFgTGEgUOmTTodkGcibyHbpl8YvcvVqgIQAwxcWb
         Mr1Tsp+rvACNFqWElqKdXJ9wxK4445R7ZDb7TWT6P1ptVax7ukwHvL8067za79okoZiC
         ySfQ==
X-Forwarded-Encrypted: i=1; AL+hErG67LuwFaHOOJh6tA5kJv2BYdXFjIV6kt3z/H/PucRDfmmBleovEUjt39+TcRmEYbmRFtz9hbE7H9A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hyxquq77/Po5P7F0wobhKEGSji1DQmoaVBSzG0/zcpUoxWXy+
	YU+bunEXpdw/fDiv0xjFSZyP+tqZQTZ9ezvmcjI/xIi7qtaaXMe9xV7rJbs93ov+JA==
X-Gm-Gg: AYBFou2IlSMCo6wO3o7YHZ1L1rFVUx57GwiXn2tX6ejRIgRqMii/Pa1F1u6Cwhf0REV
	DiWFlBPkhb2MKZbGDLmOub1RD4Kj/yx200sbdpI7pj1yr+LBmLInUhD8+VrF+ObDgPFW7jEbAND
	r15DDBjWU20Vn7wTcxYW/RvkKtUhT8Pl0S0sEtRGA490CV4GkfsFHS344iG13gJ39/o1xB+6wwj
	e4WvnoLHFWlEs1dyqLrtMSxdGoBM+SV2KKcZKXd0RY57x8RhM6YZb4eW34/clqmkZIjLXvlf3wG
	GldKUmw2x1bGND0XfYlRUCXKvNgix91XicR8Uq4X/EluObGT7gt5eEWqLjf8yqDIPQRCKc3e3NF
	n60WhkKjwLIl9+Z3hPBzXan/YjH4LJSsjxHgOFSa6b+39a+Hnp5UeQYSdl+2a8WumPGig6afqKx
	ncu+89x8+mnbFW5jvHNpmV6MwGHkDtTIeWk1Qugozhh05fc+FxQSbZSPQkEUht6M/KjmDlzW7mv
	JbU+9Yi6oJnyjbqfrGxCcrqz2S0Xt34ZFADvLfn+NATks8EgX41jZo/fWIOZ3V39sHPFfODteCI
	0VnQUkEtLvBtDBYU9CfPfIhY/uukCl1vkO/R3Sa6z4e2Sf65
X-Received: by 2002:a05:622a:90c:b0:55b:200c:76a8 with SMTP id d75a77b69052e-55d5a62a287mr44788291cf.60.1795014691229;
        Wed, 18 Nov 2026 07:11:31 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d667f0be4sm1963751cf.0.2026.11.18.07.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:11:30 -0800 (PST)
Date: Wed, 18 Nov 2026 10:11:27 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: aiyengar1990@gmail.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mathias Nyman <mathias.nyman@intel.com>,
	Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 1/2] usb: core: Pair ports of different hubs through
 their connector
Message-ID: <56075489-e1fe-45a1-a282-4cd0214b9b16@rowland.harvard.edu>
References: <20261118-usb-port-pairing-v5-0-5f1a26789270@gmail.com>
 <20261118-usb-port-pairing-v5-1-5f1a26789270@gmail.com>
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
In-Reply-To: <20261118-usb-port-pairing-v5-1-5f1a26789270@gmail.com>

On Wed, Nov 18, 2026 at 04:34:58AM +0000, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> On the RK3588, USB 3.0 host 2 is SuperSpeed-only and its connector's
> USB 2.0 lines go to a separate EHCI, so pairing by port number gives the
> SuperSpeed port a dead USB 2.0 peer.
> 
> When ports 0 (USB 2.0) and 1 (SuperSpeed) of a usb-connector graph lead
> to different hubs, pair them through the connector. Root hub ports are
> found by the controller port number; graphs in the dwc3 numbering don't
> match and keep today's pairing. connect_type is looked up the same way,
> so such a SuperSpeed port reads "hotplug".
> 
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  drivers/usb/core/hub.h  |  2 ++
>  drivers/usb/core/of.c   | 87 +++++++++++++++++++++++++++++++++++++++++++++++++
>  drivers/usb/core/port.c | 70 ++++++++++++++++++++++++++++++++++++---
>  include/linux/usb/of.h  |  8 +++++
>  4 files changed, 162 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/core/hub.h b/drivers/usb/core/hub.h
> index 9ebc5ef54a32..a186c41bdb5e 100644
> --- a/drivers/usb/core/hub.h
> +++ b/drivers/usb/core/hub.h
> @@ -97,6 +97,7 @@ struct usb_hub {
>   * @usb3_lpm_u2_permit: whether USB3 U2 LPM is permitted.
>   * @early_stop: whether port initialization will be stopped earlier.
>   * @ignore_event: whether events of the port are ignored.
> + * @connector_peer: peer found through a connector.
>   */
>  struct usb_port {
>  	struct usb_device *child;
> @@ -118,6 +119,7 @@ struct usb_port {
>  	unsigned int is_superspeed:1;
>  	unsigned int usb3_lpm_u1_permit:1;
>  	unsigned int usb3_lpm_u2_permit:1;
> +	bool connector_peer;
>  };

Minor point: It looks silly to see a standalone bool field immediately 
after a bunch of single-bit fields.  The new connector_peer field should 
also be a single bit, to match the others.

Alan Stern
