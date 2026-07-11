Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECC2264A9D
	for <linux-usb@vger.kernel.org>; Sat, 11 Jul 2026 17:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783790699; cv=pass; b=T1RWout1Qdp+bCYVYV+fVIAPP+K+1WvHPOU4CfcjKV90vdLYFiD40W86jv+HR/ex0RZJrT/nEYmoDGm2H/RdOO7ofJPtJ7bBNBkQ0xCqi1BXtFV4fBZ2zDsMA7JsprnE3fP8vfeJ7giURM3k/OmT0Y96MFkTlkxH+O3x+MK8PQg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783790699; c=relaxed/simple;
	bh=RZHwXCkPObDZWHsFmUY17YKiANGD8a5ypK1o8yRr5q8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=BeCI9mvp6fLIa5/R7f4Xuacat9ofGymYl1obLn2RBx+5XJl6XKfIRPnYKTxAJNM9Tyu7idG3Kkk/GWMidAXCSk1mEtC3SfFgTUxSSmPBxTa6bLqWf9zx/ihZVC1lPEgiUf84n5PeM3XyaYux3SxKiPIE40GOoq1Js8wdj7EVkHY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c0KesZWC; arc=pass smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c0KesZWC"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-92eafc94c9cso102729085a.0
        for <linux-usb@vger.kernel.org>; Sat, 11 Jul 2026 10:24:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783790697; cv=none;
        d=google.com; s=arc-20260327;
        b=XzXoRPNTnx6bpZNKsj2HgZjAUNbXL5C07Isd8V8dyyA0gXfd0keZVc9plCRmV2EBsU
         7KWIXDon691HBFdPsNIdKKmJJgHw0kukoldh/b+KfR6Uu6pRYuLwekkJBuH9+3nKwmv2
         TtGxW2oBEePrtQ1+h+gR21hQCLV751WWzGenCgKO2H3erud0r1VP4eUrxfreklbvtAwZ
         sOIxENcSrQjXBFVIy54j6kMmoBWG86FD3N6oK8ZQgPO+Yr5+nvMGQ6V/ssZT0h+SdMQL
         DLoe9COouVhrcjOHu9oFowR/Btfe9nsLXNh9Cp347JmYO2zcFe7QJ6KjMKb1ZjKajrKQ
         I/5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=RZHwXCkPObDZWHsFmUY17YKiANGD8a5ypK1o8yRr5q8=;
        fh=dIJPMt4ucRauxS4YhUb7eesL2BOl5FqnTC0srGljeMI=;
        b=FxKN7Gey2pCkvn3ZES/x2XcGlvKrT3oIuXmYF0vsQ/7qXgntppJ/nnHfk86WQyPuhb
         4SSEr72A7QiX4F0Ywit01EoisP8JSi0b3u9UYPLGOBAdZ0c73fKX1V1aCzBx+8rWywUT
         Pqwt91xjE6+oqa0uQElrQZ+wmXLQaVyrb05LcuNAt3mjXkWtMjbHSA+8V63w8/PuYhCW
         bp0HLq+QzIDxZPd1bctj3Mh8avCcT2y8H+Hn8jHlWYlPfmHopzs9XtKkeKisLf+7fi4t
         8ullpnXOFaqE7BrJrxvHHqtG2u5ePkIqJADcsbenG6mGZemaO+SEO/ICYdIG8fFAZ38F
         tCRQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783790697; x=1784395497; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RZHwXCkPObDZWHsFmUY17YKiANGD8a5ypK1o8yRr5q8=;
        b=c0KesZWCzUw1bGPntoESfsVYW23LLtlr3qnPq/p2oM6lmFKhfhIabUlTDxPG2A+97b
         h1hAIxkTUI8/zsVb1hQDgwhxELMXRaAHqtNE6FcWJYHdKyZJEv9FroHL7g7zMLtR3wAH
         It9J5ab8t6KOAWBHNRjMgmSH09GqxPPgOd3M1UFcPX1XBqpJvYyhsFzcwy6KvhIDEBLe
         hodF1YazXXqP/7ORiWUFHCUQF4SK5GlHYcWm5KdaMoAl+Ns+FtWNt9i6NSV7XTSill+5
         XCL3YBCHa/snjC7QODvpXqnVulODF3jcRT4OgikvWTF3HfV0g+Kjmn5f2xxk7TMXr0GH
         IojQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783790697; x=1784395497;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RZHwXCkPObDZWHsFmUY17YKiANGD8a5ypK1o8yRr5q8=;
        b=J5/V9JCrAzopiMfWt9NxFbx3SwW1Q2Y2/x3trc5/p0YO+RIEj77zDIExvls1IrIBr+
         3yWsfaceB9KVF30NSjKXOEsAWR1Qiw0gWlnZZ1RvgzBDrQC7PFSMRrsQDItVGkCageYz
         mLZwaSrmg6zCqhUf+HeCLjwq9bKQE8kmMuDzYjNn1H67sTzvH52fuDjua6CvbQ20/t6C
         pjVc2IF1gRNZcsCeQI0k10lpVWs7Lwqk4BtVPvNUKbtqAanwfqFZEYUFt5E9Wp5x9IuB
         uff4XS2U4d2TZ+A16ECeSFPBSrHtAiXrwvkkVrXebHgvTdrVgbgco+qAlsuVodxrtuXk
         3KxQ==
X-Gm-Message-State: AOJu0YxCoxseREUxgtDzkPf4htnKigLm4LaJmbx5agtrN2D/kY/fEjIN
	trcmQs0sf5I9T74sRJ+l09hUMH9j1+NIzHVC0eKDUPJ7poHgv3Cj/c6sFZkTEDCf8dqaBXmq0+4
	zPWwTtfLk3NRBCPI8HrecHWvuxb0iA5gt8/864NKoNiZE
X-Gm-Gg: AfdE7clZRdyRBXxE1JS6V1sO4ow+ufx8noSvywMkCO/I6lqz5otHcrO5QWG6OkTVRWA
	iIyMB/I7mH/30ZNJp8F+WSx0WyYOKSfZAhX85mHZiFx3jPKISGhSYMCWOaX/Z10GX4v/ncdMKTk
	wwEbFAAbK2XMmwuJOMgyv1tgT+1Y/2aF2gtIQpDadl+NFLpnPi9vVly6ZM1tSLBrpnsBo3wdlYd
	OX4/YCQ9zDVVQeuwa+QmNdI3ZDaFkCrG8yYYiWFdY5C1osgXm3/n/A78Z9v1TuOcGyOSWpPXS+M
	owH1ELkOHLHg6ybL2F8nERBa4+nmWKE=
X-Received: by 2002:a05:620a:c55:b0:92e:c117:5ee5 with SMTP id
 af79cd13be357-92ef2c618a5mr388631885a.81.1783790696843; Sat, 11 Jul 2026
 10:24:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPE_3zK2XtehxUKiYfsfbVWMa8gHAXq8p+ptm9Cjoi+gjEkKdg@mail.gmail.com>
In-Reply-To: <CAPE_3zK2XtehxUKiYfsfbVWMa8gHAXq8p+ptm9Cjoi+gjEkKdg@mail.gmail.com>
From: Keshav Verma <iganschel@gmail.com>
Date: Sat, 11 Jul 2026 22:54:44 +0530
X-Gm-Features: AVVi8Ce47hXzOGjRCBAcalQRNWpuikSVge1X-LsiztbPGdWt60Bi7_jYhR19P0M
Message-ID: <CAPE_3z+aWAPt0qrHmy_A3dLaovT+RY6F1iWhTYwGiNJWZHchHA@mail.gmail.com>
Subject: Re: Question about patches for usb/c67x00
To: linux-usb@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

sorry about the HTML mail.

re: Question about patches for usb/c67x00

Hey,

I was looking around at Cypress related usb drivers and came across
usb/c67x00. I noticed the driver is currently orphaned, so I wasn't
sure if there was anyone else I should be CC'ing.

Since it's fairly old and doesn't seem to be much active, I wanted to
ask whether you'd still be intrested in patches for things like error
handling and code refactoring.

Thanks,
Keshav Verma
