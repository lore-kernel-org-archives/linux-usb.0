Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794566674;
	b=GvNmcKJFGtIW2zHhe03qvPJmnbk6Er5Lms6k7S+fbG7DBrz9hk5LqSSKCzaHTcgz9PFh
	 Kg2868t7+4gIEFo00kX9vNwmMp/kNaJR7YEPj2N50tK5JSAfqSLx3B6Mjvt42xTVZYiUz
	 55aLSv4u6vk4RBim001ZpZR/T/FIcAHgdC6l5letUBOMqXjPmMVUbBlP4zVCkLMdLHQUy
	 hnukbq7auqYyS4QimmcZKUJSmDIGGMgJCEtZuOQoHf7j3aQqKTzztboCWK4C4AbkKBARl
	 eeVaTtHalyM+wg6xorl9h2FA8A39mtBHXt+DA3M8tui83PgLA8HmG0ZetfJvf+WCJVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794566674;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=zInJqY6LTEmXUTu5FxX9E+7sI30J7lDtTDw1puFrswM=;
	b=lKVEPeVTs7JyTf9cV55Gn+PFLpKhylTcXnw19S54kPIiUXLiX2qvraImcgTLieN/8V+o
	 X6/RwGB/TpiDWvcwUJ2fqUR8HrEkUoyGRRrKMavSxEhRNECCXZVdWpA+3coQ5OBIQ7Wna
	 dDenyiAp2oFd9vRuSzz1AdLBTsQX+XYDiZ+BrKwOwzMI99amV8J7izsYA8EDEcpvjhqVF
	 GxU/GTJrs/zJ072fCtBs8rkLcmtj6zgj0mz6x3IwDsGcZd3oknbCmL8WZwCYMHwgTpqrq
	 jUGB+P/PrCxFkG0fOrLIJMI2bkX1DRVelkU/sEOWxLdSrB8YsQe/qJ2hLctOUdT4/RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="hBj44/3i";
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DF6606A327
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 10:44:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92DF6606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=hBj44/3i
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso11155065e9.1
        for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 02:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794566672; x=1795171472; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zInJqY6LTEmXUTu5FxX9E+7sI30J7lDtTDw1puFrswM=;
        b=hBj44/3iRLCVreNnAiVzoLGZ9xMj0mc6dfPc1w6tDuiTDAWDgWwUz2HvvYrBgRPQJy
         puKWeUWlJaKd24DljFMIAtLh6+Idr3kSaLNEAG4miBQ5m5wW/M9knFuFSJn8jzous0+K
         ph3Ipha6mTMuzmAU28JyGB9z/L29mKboEaNN3afMxSU80HgoPLt0dEb0aOnDd/r3UVjx
         KpR/Z4cApQ3g4dzcVB3bTENEwKeZqm95rK3gBHHAw/zbtc7kQlFnZ3lAgu1Cf7gwzT7Q
         /KXffKsXLDZCgsAHBOnY2w4S/2dof9iO1oL7+N7kujuIP9BwHEYv5QCHREdlfctRqY/q
         CoyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794566672; x=1795171472;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zInJqY6LTEmXUTu5FxX9E+7sI30J7lDtTDw1puFrswM=;
        b=DRQNUesMs0EFhd1EKvJiAnFn5eJb7xQEgRn2Pwo4et9Qzt0umPpIlvbTTs4JWMMtZR
         MA1FsRGVeEf4Ii1dOwkYYFY+32HtUkW5Sfewhem2gZ3cyVJonjB9Z0v8kxelnMBWhad7
         eLc4wU7YMem9KhEBh9rVbmRj8B6AgLUZ39XCTlL6Qen5TdfHxkp9mEosMTyL4+C5d6tp
         OrQ5Cqjc7H8JDHP1xkICN/w4PfPq/NAD/45+aCpfWaCxwl6AVznc9GxD7ObxJjREqu93
         AZwQyI4nc24JeDegiYQZeD7jUxPMt0J2fPjtL3lJh4poYwCgBeVL0kFQ5RKojgMuL20i
         wb3w==
X-Gm-Message-State: APuU4Z99QSc8JV+vvkgqTEAVlALMtCI06YFP7Vis1FaYAK2WqDHAnQNa
	JMUallmLZPhsY6bc4qScaeHjrPVZwmB67DOv8gZwUAhlJqhKbKGUkZapPEyl5pv2xKG2R5FdZwN
	AOfUm
X-Gm-Gg: AYBFou3jyN1wgugXGx9FrDQe5i3L0B6wmtLO3N6X+Arkg78aSvk9XHRLVEUGsR1p1iT
	LOBbvGYuSILY7YHDa3sHdxBKkQ9EWoah8wwEXsG+vly6xRg/x2QhkpGkwiVod35SvZPGZCVdDFH
	+VGolcNRRUMsWKYIT7jT7vgUfdxn0vaYldMk30NknOdft8MbPWa1/Sfby6AHzeyy+RIb676s8j3
	J4kCY8THb8Ob3ro5O2Wj2ylPJQA75PT7zMhhJNubLalSgd/+vfQFcP2F4DntiNxvffgtn07hUTc
	/w6SguAcZZ9bHYNu9HT+uUlyR5YadHFAnqLDlBg+pxdDJ7mwU3iTH8njcR/bG7HROrXolFSj4XB
	9e4o6igwQ2X9z7t2oT+IrTBPJ6lZSgprDF1+Xg6/BI97O/fiGlZ9cZinUfOrU0IMyG8dh66+Xxh
	R3sl2vpAmNwWf2snsQSovIZFqbpbnvYMaSSUn2q7RHESNi7CaK50EJy/QC8qABnNZ5XyS2G5lVo
	G7GNhM4uXkANf7rPnqpqT8DmcNyRDTAw33UzhmlCCOLptxkdFev+PjJ8SgPWYO/kjilOzZ571qa
	7TbV2J0yuPPy/EalkmHfOp4ySDh7yfkoH+NPAWtxkW6F+IxhxIL4NhBS+edYJtm9h8mhig==
X-Received: by 2002:a05:600c:1f96:b0:4a3:5a91:5f61 with SMTP id 5b1f17b1804b1-4bb55a4d2b5mr43823765e9.14.1794566671745;
        Fri, 13 Nov 2026 02:44:31 -0800 (PST)
Received: from ?IPV6:2001:a61:1390:8c01:a86:2939:41a7:7e8e? ([2001:a61:1390:8c01:a86:2939:41a7:7e8e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae501bsm56364925e9.10.2026.11.13.02.44.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 02:44:31 -0800 (PST)
Message-ID: <4a7f62ce-a02f-45a7-8e81-8808551b2b20@suse.com>
Date: Fri, 13 Nov 2026 11:44:30 +0100
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] usb: uas: ignore UAS for ASMT135x bridges (174c:55aa)
To: Olivier Kaloudoff <olivier.kaloudoff@gmail.com>
Cc: linux-usb@vger.kernel.org, stern@rowland.harvard.edu,
 gregkh@linuxfoundation.org, usb-storage@lists.one-eyed-alien.net,
 stable@vger.kernel.org
References: <20261112160929.6479-1-olivier.kaloudoff@gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20261112160929.6479-1-olivier.kaloudoff@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 12.11.26 17:09, Olivier Kaloudoff wrote:
> So by your criteria this stays inconclusive — I cannot reproduce the
> queue-depth wedge on demand. The enumeration stall remains the only
> repeatable failure and it self-recovers via the host reset. I still
> think the blacklist is right for 174c:55aa/ASMT135x: two filesystems
> were lost to this failure mode in the field, and UAS buys nothing here
> — BOT gives ~3x the sequential write throughput on this bridge
> (~136 MiB/s vs ~45 MiB/s) with none of the instability.

Indeed. Could you resubmit? I'll ack the patch.

	Regards
		Oliver

