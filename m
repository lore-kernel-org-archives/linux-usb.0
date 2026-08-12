Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A9134C134;
	Wed, 12 Aug 2026 07:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786519576; cv=none; b=FVyhFigdCFTZRJgIMzInvuocu1bSoGG8kLz9kjKGjUMYen5LK0wWvB13+a9JOf7JldU83N0wXisGe4/hFtI+TjGJR5xB+7Xczgsr5FggX+vBlrC+JH3ZSEuH5zjT0FNFaPcyj9401d6A/PQDToFBuJaWpqgIuWDseE2zVID+dJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786519576; c=relaxed/simple;
	bh=tPFdSagMNhwO8H4YSmuD7xgqNN+5/455dFASniJLrXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rkqgApJ9H7G2hmt0yea4hJJHBz2X32ltxjeRjsz+bnhTaNvooWep04+yHoViYFZjpsWcRiIH0Itv7GpO2LrDRD4ksGaD4BCliq9YJmMoky9zq5lld0OQuBHyaeTyB1dIoqOraKGbza2zP5rNHic+ywcJN+0oTLpWAss8+XvHiqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=PcFDDv3W; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lzKF+9ME; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="PcFDDv3W";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lzKF+9ME"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 55E151D0013A;
	Wed, 12 Aug 2026 03:26:14 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 12 Aug 2026 03:26:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1786519574; x=1786605974; bh=uhC146gvbT
	TxjCGMMgmnO1PsGLOPBxBQJQhuvepqUlo=; b=PcFDDv3WbowMWwXm+lMDUDtwUS
	J2UxDj9FxA1byd8NulJA/+oypz3yicwZBWpX3y8dBzENNASqx+JRfJSv03+mwgZB
	mxcLJzKlytIlMzw5HK8V2TbtBrcZyXSQC9Otpz5cmXNbCU8itPH8ZCWMwhhVzjed
	3ahXLTY800+FmbqN68JcmtMuoJmQfWUh/U2kSiZzWXGdY4U0pu2DF7g8kiX0auXB
	D+IYWdVBdLV7Yo0mG56ZEWj5aV5qb+lkW/1KwRaPwdlGOSGcduInO9Xp+5jeOCeU
	GVt/5+iZwCxFx08tWBUA4pzCPb0d3PDcDE+JdX3zPN8TNrPJP4He1jYBOzBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1786519574; x=1786605974; bh=uhC146gvbTTxjCGMMgmnO1PsGLOPBxBQJQh
	uvepqUlo=; b=lzKF+9MEuM04Si/cgdpsJ2qejhBSuxO+borz8LkT2vL4W4LSdbC
	a0SGsmWphc9XGwSEB3pBc/O0lV2Bl4EjDF7s0zdh3H9JmwaqEAaaNs8Oq31v0/4Z
	znz0OLNX5OnpGCD67VJ3h7ctO08aIOdTOww31INvOmMjGxxNrThSJRqahAVHAT16
	0jR3Lx/cruwXAtiNi+uXY3RP8W51p7jbUy+1Vq0DGYAcRZAcIL0mRb7aqB82i1NZ
	MPn90zp3KaLPeilRE2Rt91ALzGfYMzXomQwvI7Egt6jS9M1hrfOoCuOxxlHPaK4S
	iIxPfOM8YLSUfwpp+vbcWLY1rXXwP7H9c/w==
X-ME-Sender: <xms:FiB8amAhEwZ1kHwF9kFv44Ejydku7PqhdgG_pjIrEhfl0xKOPI63bA>
    <xme:FiB8as71gQvIzb1_3FtxXPWEdYFVILP5BUsXycEkAqsEY9nUhxmFc1ZRILaHNiSis
    DJD0R1tYxTxAxVor4Qt2YCpr-s81SAb3mob6842DCjN5e9cTA>
X-ME-Received: <xmr:FiB8auBN0CmAzhBE5zgeV5SRBJSs1-ck99BV0_yl7CU2y_yXtPKQj6Y>
X-ME-Proxy-Cause: dmFkZTEREdGtcVPZyvce+ENUhU7i1XijOqvykogvfpKtwXmCYYToA8uJrWqOJL7fjbW3CQ
    kLTPTr2hOTdAbs+L8pBlKrp66uj1ib7n+BIQErcAD3nlfZIblpgdhYH5CjroWDRob4t8S8
    ITih9lyEeQZXm2Kn9ePD+DvxnUBRjSK7K2BNqiPcMvbNt/zE8P8vRJjsE8pZJYTTDyz5mD
    DBKEWLlbpL7WYZzMVgqB9GdEtBpYhTVYTqwbUNIUz8PbsUQcIcmZVFBY7XNT1G/TzaOPgO
    gvKsE54b1iji0NZHK1fyFaWMIXc96ydE2hKqGqsOS5szek1gK7tjI/UYM8PxDt59dsITVk
    mxpqRDnbukbjS06NCkwo46o/zDRUKLAubshLBW0sOK+lSrbHdjLwUFckJZlPUtVg2OA6sE
    bC3hoYHgTCuPM4tdcfWuVo1yZcfAphupcvMwcsV+dQz0p4JfHoZm9Lw5BYg48McZct8R5b
    pG6QE2tscHlNBtuK/ab9ZKmi8heNF7prNw/1rSCJORu1mD9aXa9hd57yccK3hVz3R6yCbM
    UxMpD7GdIZwSKOoOYaCHGEntumioAUTLXvE59xZoEpabROY141b7zboaHbjV7dWLjAKuOA
    mWf7EHS8UuEmnJPI6AVGFFPD4+7yHAWoLLOIcTDXw9IrCHQXdG9I+kLbn7rw
X-ME-Proxy: <xmx:FiB8ai59XYVaEsbYWDrKj_gtpGFwRP-LVCHycc8OV32ticWPgFCXCg>
    <xmx:FiB8antAdL4GCWPGUmhgcNsOPvDE4kbe8Ia-cVIcJABTr7G8gYRuzw>
    <xmx:FiB8an4aOcDj1j5JvKM5-VZaD8IS2AJQvebAJsEo4bd1D_GRZWcItA>
    <xmx:FiB8ar2AcGp70fUXqkUJ3QqA250AEV9adK-Ybd6IlUxAUiDCAO29gg>
    <xmx:FiB8asCqKNMWIvnokZ1jlvdgvgTbHRiW3ss90kDh8CU3wvcu6Y9_9x98>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Aug 2026 03:26:13 -0400 (EDT)
Date: Wed, 12 Aug 2026 16:24:39 +0900
From: Greg KH <greg@kroah.com>
To: Jason Colapietro <jasoncola1@gmail.com>
Cc: Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Hongren Zheng <i@zenithal.me>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 RESEND 2/2] usbip: apply list options regardless of
 order
Message-ID: <2026081209-boring-discolor-5b45@gregkh>
References: <20260812063910.31293-1-jasoncola1@gmail.com>
 <20260812063910.31293-2-jasoncola1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812063910.31293-2-jasoncola1@gmail.com>

On Wed, Aug 12, 2026 at 02:39:10AM -0400, Jason Colapietro wrote:
> usbip_list() acts on -r, -l and -d as soon as getopt_long() returns them,
> so any option parsed afterwards is never seen. -p therefore only takes
> effect when it precedes the mode selector: "usbip list -p -r <host>" is
> parsable while "usbip list -r <host> -p" is not, and -l and -d behave the
> same way. Nothing in the usage text suggests the order matters.
> 
> Record the requested mode during the option loop and run it once parsing
> has finished, so -p applies wherever it appears on the command line. When
> several mode selectors are given the first one still wins, as before.

This changes how the program works, so this might break existing
systems.

Is this a real problem as-is?  If not, I'd be very careful in changing
anything here...

thanks,

greg k-h
