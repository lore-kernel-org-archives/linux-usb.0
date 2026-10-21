Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792601587;
	b=RvWGViWaxFG17X6o6L08jRKvv037D0xZniCzOBNMlGgb3qHSoDR/nTpT1RWU1/p/Gfir
	 URKrxAQ1Of3DyYPi479Rv9xCndGAqzm0YlCbjfAB9TeZbmgeqXMPwqrS6PZrYdulvS5T2
	 YpdRX3UOcSStkA/5N3q3T+81FWhX/ryTi69K/exus8tijXdvak8cmlB2TrBtAaolfNDOb
	 lnGn2JGSwKYy7WAHE/vCar2w7yP/h4mLEtFl0gnL9pBHwcwOvUAkW6O4F5dEfShrQ6E13
	 VKmWlZoEJ09iQuyk6oBzL3gRPEzI4Ezq7P38V3nELgeHZ+C1qQGaoVSNLhXynL8Tejw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792601587;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=nSC2RftGnOc8ySFYnSYwaLrm/qw08VCs4pc8MqBDUXc=;
	b=RQz1Gcq/wpFdAfBYKGvx/8dWm7rnW3VBnB/SXTSBUu23WxRYHS+FE3quQi64SOtYMNK/
	 5aEKJqPGfukFha5l1/mY2c5p800vmeWiDpBbi4rNEihIIcBRlCzeCjmL6EqsFd1f2D8nq
	 BtohQkC8xvblWTCarJJUKV5/TytwQWzSZUKxCPGXHlI9hRbfT5tMiV9kI2QpDc7yCjkUN
	 LAkUMAJqCtAwE3egJAY2FBnkgkx+w+dxVvO5Mpqh/Tjlhs/NAPDLEcfrNe1NUQRxbgy+C
	 zVYgSSzmU6XgLKurXrx8aFEe1sgeXIXDk6I/423Le/gYl6bV4ngbntLru+Ajc+zzgQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=NqKkLpmE;
	arc=none smtp.remote-ip=209.85.222.171
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B556606A321
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 16:53:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B556606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=NqKkLpmE
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-93f3c895a0eso84780185a.2
        for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 09:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1792601586; x=1793206386; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nSC2RftGnOc8ySFYnSYwaLrm/qw08VCs4pc8MqBDUXc=;
        b=NqKkLpmErJ3IDnkmKkoqz/HqxI9ex62Am5ktP2+Hri1h/Y9FeFD7HIVU5T4UJZGWK2
         0gALUo1F979lqM6ZFzOKug05qXqq8LLtHYfxLXYf9E4f1SEwDHXWqviK9dxIgKFqnV1u
         BKRj8hHi12pD8dD+mlXmaMe+vSjq/0D0pZAQTLFDIujp/szH9rp/1Ch1MWmhqiHwkGl8
         PNMwQR1Z9fRsjVUjuvrgp3b3dQFmV84RYmON6pJEU54Ql+ok0AnL7vO9rTFJAZgiqsAU
         KlzCwaSbQkoXXJwMS2r6slPNhTfPmApCoxWYTSyuMVqryxyIKbb8gPLJQFan7nQJx5uC
         GaiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792601586; x=1793206386;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nSC2RftGnOc8ySFYnSYwaLrm/qw08VCs4pc8MqBDUXc=;
        b=b1XnWAff6szC1AgQZ9jStJY4ccwFdflR6VxFxgTJJgBXAkpt1LjDy9RPMk2Xcpe/lQ
         wv/JFRGpxOTfNJe7mBijnWpdc8BwGhAO54U2vVa187q7njQo2Hd8+XXBSppSZ7ZSnSf7
         Iq8O6UiF4O/TFfJ3A1qMfCUtQs4Xn7iMJBmx1YPaehXJ63WXI0vWmH+seFTrTa2GsvrD
         siRJlMF+5w/bm4z/ZA9AEiL6iErom5le7QEcWSs+5S8OaVkDM6FfHTfKbrlNif+3dkar
         1Q/Se8qFmI+dWCDsLOrofXQKIogrPKSI2RLA646Sdgf+5K88g7obVEzZ6GyGm3oI+Fxo
         m9ng==
X-Gm-Message-State: AFq9FYKZddCjweCx4kJB6uwvFpE+ySd4cvzYhm8ANB5pnL16zi4lKNaX
	zV+hOTccTn4NQ/ij3QVRXIAAWJG80nxfedeoeHFbHguGWfzZE8JL7RCQO4aDA0bh+Q==
X-Gm-Gg: AYBFou1jlMF5VWE3bu1xzc+ZubIpRvSMSgBLgJ81D/VZMtLFHkiXu9ygSK6evoAUnRF
	F1xnOVi+77xcVqUEwfgzne7KVx3YWfcdmEF9i+djClDCE6EA6tU1/yGzJOcoPaEOC757kYh3U1Y
	Gl2rxbD7K22wK5AJ0bHV6nMGQTjZv9Gu0g88wlrxv0RM9e8DZZIqCVtTJJB/C1RQEhKJpFDBGA+
	JrlASb05zZUJ5plbhh0QDMCWJyOJstDcHlhc9LtDSu36+B4I8WzYNcMde9zgXhoDSAW6D8JzJFd
	X9+FxGjMm6A/gdeONI7vt0oIW9kksDhwYGm+wByjJsKH63pzCKzT5mDDxB84Cu1vIbO6G7k5diE
	m3dpLwYmWPqtquFBVPg49QvsBmWJavHz+OMzNiuwfvrTLoN3wcqK0k+wpXv6qQJbV+x+LAaxskd
	Qlr+vBdDSP3cCvFVJB8KOM4wLypxDgdYod3d/SjOEnKcEOVaNPBMCGfegDjaMdcXTgHr8H2RR57
	ZtUq+sTciDxI3/55QbrfP+9Iv/NFEgQJRIdyc/3C6zAs8bgsbL81vemrryc5PQVcIexnHEl46x+
	yMoJBbqDO8XPcvn4uuwk6FtUuA2G0gNuv0HhsagJWdW1
X-Received: by 2002:a05:620a:8909:b0:93e:5016:e3a6 with SMTP id af79cd13be357-93f57f05f2cmr544361285a.26.1792601585999;
        Wed, 21 Oct 2026 09:53:05 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f56e1fd35sm295566985a.37.2026.10.21.09.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:53:05 -0700 (PDT)
Date: Wed, 21 Oct 2026 12:53:03 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: Linux USB threat-model document
Message-ID: <7480e993-b873-4ea4-ac6e-45bd22975f8a@rowland.harvard.edu>
References: <CAOt5ifARcQqqGc65hHXR2JNTDg0hT0cF55Kb-6USEsqjEPM1nA@mail.gmail.com>
 <2026021847-acclaim-coil-fe7a@gregkh>
 <a38ccefc-6233-4be4-bbae-0ae0d4f4499b@suse.com>
 <eb96e0e4-b02a-48e5-ae07-bc31584f0855@rowland.harvard.edu>
 <e63ee746-dee7-4b3c-9360-95e96fadb765@suse.com>
 <862abc70-18ce-422c-bdf2-f02b984193c0@rowland.harvard.edu>
 <2026022617-disengage-spinning-c6bd@gregkh>
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
In-Reply-To: <2026022617-disengage-spinning-c6bd@gregkh>

On Thu, Feb 26, 2026 at 08:29:45PM -0800, Greg KH wrote:
> Given that I have to answer this type of question about every other week
> these days given the fuzzing reports we get sent to the
> security@kernel.org alias, I think I need to just write up a "here is
> the Linux USB threat model that we currently support" document to
> describe what the state is.
> 
> We can then work from there, either agreeing that we need to "move" the
> level of interaction for which we trust / do not trust a device in the
> lifecycle of a USB device, or just be happy with where it currently is.
> 
> That should work better with some groups that I know are working to do
> stuff to "harden" the USB device stack for some specific use cases,
> hopefully just using the existing user api that we have today that
> USBGuard uses, or possibly adding to that to handle some missing areas
> that we have not previously considered.

Did you ever make any progress on writing up this document?

Have these outside groups gotten anywhere, or identified anything that 
the kernel should do differently?

Alan Stern
