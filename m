Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7559936B93E
	for <linux-usb@vger.kernel.org>; Fri,  7 Aug 2026 21:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786138297; cv=none; b=n9myAFUb+onQE52Jn7oByhAIk4DcEMoEcGt5Rum3/xQ70UmAnYkMj2r/pCzWs8dgdg1I7OX6pl1Z7I7F8Yb2b+I/dqIGbUz4Mrx07Ckg74yHlYY81pdkfTeG6PlIPMdFcsv/oet5Nb+1vCtEbuU6XhE/GT3P4V2FUUNrKwtWxbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786138297; c=relaxed/simple;
	bh=KUguev38yM+RbcUmSHFPQwyNmQloufkDW7uUTTVtDw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f2oZlboW9IKq1a/jo6YaktZB4e4nVKmIWGQoSwQT1IfHwHFTqtwY+NvcSTEtFkaBsm9KmVBAAUXKrbhF1zjJ8MvOcpQByRuihfoErZnO3YuWyscr4vJtd/7j/Mnd24jeOj6DdF8hUJuBPTQhGOVg7AtQfdAt0T5PS4wy0gPoat8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=f+AJq0sy; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="f+AJq0sy"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-52b4e988c77so110461cf.3
        for <linux-usb@vger.kernel.org>; Fri, 07 Aug 2026 14:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1786138295; x=1786743095; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4HBv3sriGYl8j00kthNvjhsWE59fI1TUMAejDCsiQ2c=;
        b=f+AJq0sybAARBhvrY9pHkHyNfw17pfA9o04F/MjoxwzxEeFtQzApjNmzGQ+kQcHbxE
         jrWnxH+gIYLZrTq1+E0GCXR9J33ZqP3pQ+uznSGFYZWiHY1j8ob7d1229X4wQgqHuy0A
         eEYGBqa8/6nlOXUSYAmjsZ/Ub0cnp/tHjeYA/rhFhK+VYznFYH57evcuWx6R7nAOjS8k
         S9uL/eqMvPNtNS6OiGbtrob0/z6cxh7vqczkdiqznoUg5d/MeQl4OpxnJ9+owwLATfwO
         zmAW7oQpNSAO2+SgpJ754p1Z1SQt60gh/tdVBhY08XpFU+OzZq25TYT2aVrtW2W4CqeY
         hwaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786138295; x=1786743095;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4HBv3sriGYl8j00kthNvjhsWE59fI1TUMAejDCsiQ2c=;
        b=OzPnRmoJ/mzQPcMMFJmNnW5SHXKTXsREu2jRyVIv8yjrkBI7s21kcbw/3LGH13bePb
         vNhNBWBW5H+M3oPzmTMDYhTzbCGShHBzlmjiusJBZt2rg7AJ2otJgBsOoWcpkBRME/EC
         G0sTVRnMD4edWOAbE7SqJWNa4luKJPwKqQdldZq/bhtThveCpzfTaSthrFMJoBUZkbmn
         mLs9hJFw3G0uf4BNyTJchYJsR21TCw7c1liCcrB1sN/5QXa1aCgb5S2AXjHynkaZLLFT
         POvdYZ6mxSqDPVJh5roPQLQLIW1rHR7TZvazVWLaBnUSSTv63kaO1zfQcdmV9xOWCAQh
         lGow==
X-Forwarded-Encrypted: i=1; AHgh+RrkMiZxXI4bPkoMzfXQMjT8Hhmh+6MzR0bFt9R9MsYQkgl86xRmRzWasJSRhdDpKq4rApyypBsCLwI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyB/KGJqyjX5H/jrthtXO+HG9mMTSX+aNV4G5LojgZ+dUPap5Mw
	dsl5Tnm+30QOSSl5/PyEJ2KgjIE0Rm6gN+x7hJxQr2beOu5k/gb34yyGR34rdgsz5A==
X-Gm-Gg: AR+sD134Xf/tgtztTSpdsUypXIGeyJ7KlioA+8QevnhK0mW7Amnjd/LhZ7R3nfuny/U
	QP833AgLpy7eP97cfsfh756Q6RqimwskCv6MlZZLhoZZRVbqchZLwTdyo20GxrfvDWAPcGuS99T
	CIx9QaAgIxUPRAN+BKKZ08JyoCZZs5tg3ZJ3nwG9sCFw0e4KlOGOnz86zbKgASCrisoZWuAkTg4
	rtp39e0caZMsmRNmQ8tltrH49ngSlZjMBUG7bo6hOk0xYryp5p7hDVkOIAm7+CzOQ+pIVWi3L4O
	fJQR4BFpF+KkhAVN9jKDg0+L6SL8Ujj1qd9uYlB/j5S4Zk20z2bErPoHrBJAUXUW3QpbdlXNiRL
	G/D1kxWEyNrhWfSrDMP74h33zrEGHBf0w+COhSwBVuIecyb8gPLvwgY5KM/0Um0k1i7rPBi1C1Y
	leVNgN+5ZKkwepjfcPTxqNaxVZnb1mgBnVC0RhI9Ueugt0ADX5iMtEkdueWE/3Jg==
X-Received: by 2002:ac8:7dc1:0:b0:51c:92a0:b2ca with SMTP id d75a77b69052e-52d20a5917dmr44906481cf.34.1786138295250;
        Fri, 07 Aug 2026 14:31:35 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::dfd8])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52d1663e9d6sm20805091cf.31.2026.08.07.14.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 14:31:34 -0700 (PDT)
Date: Fri, 7 Aug 2026 17:31:32 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Igor Skalkin <igor.skalkin@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Felipe Balbi <balbi@ti.com>,
	Tatyana Brokhman <tlinder@codeaurora.org>,
	Kees Cook <kees@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Sebastian Urban <surban@surban.net>,
	Seungjin Bae <eeodqql09@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Trilok Soni <trilok.soni@oss.qualcomm.com>
Subject: Re: [PATCH 3/4] usb: gadget: dummy_hcd: fix SG transfer handling
 across chunks
Message-ID: <87b4d9c5-6374-429c-a236-15ef5cde759b@rowland.harvard.edu>
References: <20260807075438.5566-1-igor.skalkin@oss.qualcomm.com>
 <20260807075438.5566-4-igor.skalkin@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807075438.5566-4-igor.skalkin@oss.qualcomm.com>

On Fri, Aug 07, 2026 at 09:54:37AM +0200, Igor Skalkin wrote:
> dummy_perform_transfer() may be called multiple times for the same URB
> as the transfer is progressed in chunks.  The previous sg_miter-based
> implementation kept iterator state in struct urbp between calls; on
> resumed chunks sg_miter_next() would advance past the already-consumed
> segment, causing -EINVAL and broken transfers.

That definitely is a bug.

> Replace the stateful iterator with sg_miter_skip() to seek to the
> correct SG position (urb->actual_length bytes in) on every call,
> followed by a fresh manual walk for the requested chunk length.  This
> makes each call self-contained and correct regardless of how many
> partial transfers have already occurred.

Doesn't it make more sense to use sg_miter_skip() after each time part
of the mapping is consumed, so that the next iteration will start off
exactly where it needs to be?  That way you avoid the work, on each
iteration, of going back to the beginning and accounting for the
portion already used.

Alan Stern

> Return -EINVAL if the total copied length does not match the requested
> length (e.g. SG list exhausted prematurely).
> 
> Fixes: 14fce33a960a ("usb: gadget: dummy_hcd: add sg support")
> Assisted-by: OpenCode:claude-sonnet-5
> Signed-off-by: Igor Skalkin <igor.skalkin@oss.qualcomm.com>
> ---

