Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FAC3B0595
	for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 14:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790259883; cv=none; b=rRq33U9Rc836WC7GiTmry08XKsVoBIhht8Nsa7E8PFPe9B/me/rSYnisDd2Hq/+gx/dAljPZwo+t9f3ZXs9wb0PherzWBJiUXb7kuSXDzbW8AoFuqhshRSWme82A0Xxbu4bnXUjt6n0pC5iYfQdfDbiy0I7B+zbQTWeUuiYMXas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790259883; c=relaxed/simple;
	bh=CpPebt1boAjkIYdju32M4ceuk/hM6KmrE9O5Nvo5iE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YhCqmbJvoS1WQaebsnpxnK2n63amxCj/Uu8x9Ef3vNu2zxOZ1mZO3xj5dQhahoSwO5K48Uzn3EzOpqxrK6v82GMPZd63/oVLFH+ZQTNxVwHQDrPM5LPSTf3V5uEqA/NLv6SlZDO+o+omaYIDwPCw0h+hAEpqDp6fzrVUX4bPwgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=qn9QAKNg; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="qn9QAKNg"
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-52fb769ca02so20779211cf.0
        for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 07:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1790259880; x=1790864680; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tP9huc7KmRZ5Wpn23x8YAWMZ4hVPyXqd0mcF2NaR45U=;
        b=qn9QAKNgyPgHKl6VLc+gmzzClvIFAYVVX8DXc2Xx7nysQHdMM+KdMGjY2thkLhsZ2j
         3nkjDrMqc7xjC/wDZ+hZcC36NrsOlsWHSksAd/6KQFH1++S8xT8y9Al/bYjieUmHAWZE
         KKdZVN92xTP98xDeFlsQe4gN6rJQel+1PfnD+bFp2kffDjIyMAvceunD6HVTBqVZAWJA
         Qdq+OjILOBDjBzr0cfVbfMAmNChBK53li1eJH3AaOTJdgOIgfPrN09ADY5RRuI4mJRQP
         MaZ302lzmS0E4HGOLlEGA3wplD/9xGDuoPPXHB5Zkaents/Kped11HDjX6sjFbFPHg5q
         FjsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790259880; x=1790864680;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tP9huc7KmRZ5Wpn23x8YAWMZ4hVPyXqd0mcF2NaR45U=;
        b=BWmrtfQ5x83rAeeYJzBaqCLcTKYSyfMvKz+S2iMenzUoa3IQhM6l/A8gGtxSfLnPQA
         WqY3nOOOjuw489wIWWMFSEFaMOLudYFXVOQnJTv77tLDNyw0nPUwNa4urhtF5SuUM16j
         OQi2BaoFLJddd9SOXD8lcwTer83hGO6ppqD8hRQMPFhYjX6996ttpMeUNR6T4vJkwsIS
         HmQMARB0dP19oSk59r+8Crzxy7VSPKSu3/ZRWQ5DEESDLbklgS1X/Smnr5i/VgMoXCqq
         /ABnC42XlFC52DwkINZoDujtODjXxhbLg7veg3wMv27Emg/SozTijTIofW++X3YQNLPq
         YYAA==
X-Gm-Message-State: AFuF++l9XCskwSVkETa38piEBZqhR6/NJlVqVADFQkC2jaDMDnmyHQZ6
	81M6kf/wbRHGb0p6l1L4gwTkV6QbIhrOA6KvLJhJloLy+AnMVOx11cHEHN2eXz3XGfOm4yfLXpe
	w+lvmWA==
X-Gm-Gg: AYBFou2ji6csNFePrIHAkWf2bMjtlHBl9SeGP2KV74IDVljCDYGd+fnU/zUVS+FFVUt
	Vrbs3Chg5MgLvtWgE76XhN8e+/MY4dS8rxiUfP38EV5pdPThgnCvWHauq41Hg8h7318fCg+d29C
	WRi/YwnWAjp+F9yOcGMUVfgAIKu5BXlUrfqQ3oj2h3nJgtBse/Sk+Dt3HF89Xyx7IaSDxpOz7zo
	47btpQ3IR8TsS7Rj+S2VZyuxVIfi2dnPiFZhP9i5cq/i8GQtvpfxAI005xJ2dQ+BhwoY7BiPqVj
	eU0hCyinNFMDkFWGo82xgAM8Y2Bk47Ywnm3q+QDpAptyBgthzxufmpicG1Lfqk16LfmOi7AIbke
	Zy5AQO2tmnEvQPbHhaeZ/PUkTi+6lhjAOUvfZeXUJ8T2UzUgc/6CMKwuxOgyWp6+LsCsfHqXjJC
	fQNe6iTkRjKm5vmLvbx81Q/ZWymDE7mEv+JljQSi+2winpbXyufzW7hqjI7iezoGjChxePtGX60
	89G7vnjOJC7EUUH4bJdiAGyajE=
X-Received: by 2002:a05:622a:250d:b0:52d:28f8:578c with SMTP id d75a77b69052e-532feb18bfemr24361881cf.31.1790259880171;
        Thu, 24 Sep 2026 07:24:40 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532eb210527sm42774991cf.12.2026.09.24.07.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 07:24:39 -0700 (PDT)
Date: Thu, 24 Sep 2026 10:24:36 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Johann Klammer <klammerj@a1.net>
Cc: linux-usb@vger.kernel.org
Subject: Re: possible regression in usb-storage?
Message-ID: <0ec3cc09-0c51-47b4-9f3e-934d5c23ef5d@rowland.harvard.edu>
References: <c6fc5257-a41f-4ae7-92fe-93284d9ebc43@a1.net>
 <79f2c208-bca0-3bf2-afdd-3bf095ff7b31@a1.net>
 <ef6be2fd-29f7-4577-a229-35058bb9191e@rowland.harvard.edu>
 <3df6f96f-1553-6842-0e11-9c08254b8da7@a1.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3df6f96f-1553-6842-0e11-9c08254b8da7@a1.net>

On Thu, Sep 24, 2026 at 07:00:25AM +0200, Johann Klammer wrote:
> 
> 
> On 9/24/26 4:08 AM, Alan Stern wrote:
> > 
> > > > c6f9c300 1171417312 S Bo:1:007:2 -115 31 = 55534243 03000000 00000000 00000600 00000000 00000000 00000000 000000
> > > > c6f9c300 1171417339 C Bo:1:007:2 0 31 >
> > > > c6f9c300 1171417347 S Bi:1:007:1 -115 13 <
> > > > c6f9c300 1174819198 C Bi:1:007:1 -108 0
> > 
> > And that is a perfectly ordinary TEST UNIT READY command.  But instead
> > of responding normally, the drive seems to have disconnected itself from
> > the bus after about 3.4 seconds for no apparent reason (the -108 is an
> > ESHUTDOWN error code).
> > 
> > Alan Stern
> > 
> that may have been me unplugging it.
> here's a longer trace. I waited for the threads to crash.

How do you know that any threads crashed?

This trace is the same as before, only longer.  At the end it has this:

> > c4b80280 1844172026 S Bo:1:005:2 -115 31 = 55534243 18000000 60000000 80000603 00000060 00000000 00000000 000000
> > c4b80280 1844172141 C Bo:1:005:2 0 31 >

Another TEST UNIT READY command.

> > d8d9e980 1844172147 S Bi:1:005:1 -115 96 <
> > d8d9e980 1844172267 C Bi:1:005:1 -121 18 = 70000200 0000000a 00000000 04010000 0000

The reply says "NOT READY: Logical unit is in process of becoming 
ready".  The drive sent the same reply to all the preceding TEST UNIT 
READY commands as well.

> > c4b80280 1844172272 S Bi:1:005:1 -115 13 <
> > c4b80280 1844172642 C Bi:1:005:1 -32 0
> > c4b80280 1844172646 S Co:1:005:0 s 02 01 0000 0081 0000 0
> > c4b80280 1844172891 C Co:1:005:0 0 0
> > c4b80280 1844172896 S Bi:1:005:1 -115 13 <
> > c4b80280 1844173017 C Bi:1:005:1 0 13 = 55534253 18000000 4e000000 00
> > c4b80280 1844173059 S Bo:1:005:2 -115 31 = 55534243 19000000 00000000 00000600 00000000 00000000 00000000 000000
> > c4b80280 1844173141 C Bo:1:005:2 0 31 >
> > c4b80280 1844173146 S Bi:1:005:1 -115 13 <
> > c4b80280 1846480092 C Bi:1:005:1 -108 0

This is another TEST UNIT READY command, but this time the drive 
disconnected after about 2 seconds instead of replying.

Alan Stern
