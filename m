Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793158803;
	b=SaPndiB63b/X9qZPZJuoJDhBtA9z3jhmxApPmyOrF2i2HZLqAZcmSGkdSaXvxAvuvSpU
	 jl8ExsV51tkw60t9EsVl2U05yVzdKmHefihlGgyreWuewZGZd9vSrz6HSiRbJrQFxJI/S
	 6zGtM3f7LBH/18Oa5Th930W90/9M/W4OvtknjJ9LTGKF9KgldJ/qkFiKSVoTj143oVapv
	 zO3k56DMZiETMUSXbZQMkc7usuqrSznwGePvFIRkhVSZTja4bR1rmkFyFd4J+5XUcs0KF
	 h3uJsXQbLUpIyYp9YqjTxQWvSPzmHcxZTV6C65F63Gf4awFBRAQyxFa3kYVTyCC768A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793158803;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=nZVUbgtUTPeWWCTCN1m7691GzutA21b70jDB4f7tnpI=;
	b=kXj2pP9rdHRLBLm5It74mWR1lVMDthCilEK3upw31scfkEODzUv9YZofzeD/xbJWrb6v
	 cQhngDKd5MOzq0roRPFpkmKYork62TJGnIbMgtz9Qir1p+6qRC1DNeibLSsapeF2A4Dyw
	 KhmWr7jRrba0RaNrKP5rzeFLXU9bmX41kL9dbLxU73herbcjBbzwvsjuB4dL3VF3mmcMv
	 wVFTKvBwlfkx51b6bU7+uroX8MLNTiviKqhVE2X4NDMmSC8pYy6udvzqTy+ZkYtBCiBtV
	 iwu2PZA571F+pAoUMwVqNRq1GGTG+7PWCTVBP4ZyLeA/hZFxerKbL0RQaZJ2dHltmvg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pbjq3yc3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC00C606A31E
	for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 03:40:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC00C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pbjq3yc3
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35b2c599f43so1153973eec.0
        for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 20:40:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793158802; cv=none;
        d=google.com; s=arc-20260327;
        b=MnToPjUcNqeKtuQosetYoJokosiOxVp8OsYXCEshTtWIsnWLY35qdq5sWoRwjPN6P/
         hIPfOwGUoBlf/MNK/efDEUTCnw5FAVbOCZte65FICqDGmi+AtLdFV9gMvm+iJHaEkoF/
         nU/6ddn8ZJkdpTP3LOsu6rdYub6urEtQ+LZS8Hw9xMeRw4Hn9LuTrwbe/Y+utOr1b5V6
         Kh8RbyhpVA3hJGrT4oaXc1YHxmhVFcjrLlpu5r6F5PkzQ5slom4Incy6Ng2eTzTQInOa
         htPZXlkqCfwVPT5zWg0wBhkltotFUn6+X0m5/GT5w0r36P8VFRrVayw0jPk4NQZ2CXMI
         CHqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nZVUbgtUTPeWWCTCN1m7691GzutA21b70jDB4f7tnpI=;
        fh=dmPH6IbyglBnUjHkfxoOhsBS8BYaGY653Q8wP3By53Y=;
        b=SwGuaR/sYzsL2uAai7qYPEtwhWbdJFoV4AMPmdQmH1SsA0N860FBuoTkNScPTy9FLd
         7u6WeLEH1sxwtCpItJPT946h/ZdzlWkLNUkIb23mdsNraGEZvnrWG0iCUJF9ev3srotT
         /qz9ewI4jvJNQoHIHYIO6qu6Y64zc5uLp99CAkVXN+aQWb71tbOIL2P0ZxGsToKd/2cY
         2swHDVajzVPAmxszcwdbgf/fK3UVX30yZwbGgl09R5oiqJhzg906mNXG+PhzcWccTtqA
         5Mcp8vLjq9f/hrXCOKE2XCDMn+QyWCyCHl+0cbOB33JnqrYSpJBYktXTmr3DL/fBYZlQ
         f15Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793158802; x=1793763602; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nZVUbgtUTPeWWCTCN1m7691GzutA21b70jDB4f7tnpI=;
        b=pbjq3yc3j8wdNHlL4uh0ewxXyz6i4Y3ACydbICYJdBDfD6iHkpTkJW9gZUW8138d7P
         P0l75SMe61hEBD54J4/G0X1O40+b6g5X3EYu/eVaJdAWIttQNhOc4FdhO2DC/PIBoWdO
         nEcCswHqJUJyxBjDUlM2NNxLIdVScZRK75SowMwMcuulD98RKD1Vyy0x/e1CnoxGFyB1
         ZWdK9wt516HZo90j8B8iC5EYae4tt8aWyXKkvyljyj0ZiEwOYlW3OSHPN+a3D529k82p
         hG+egmpILyJpAZ472F2BZ1zNBTuCT1H15rK8dh5q0qcSdWzUNf/WHVhcf4BEaZLbIiaW
         3M9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793158802; x=1793763602;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nZVUbgtUTPeWWCTCN1m7691GzutA21b70jDB4f7tnpI=;
        b=Po39BatNJCfHyChcA3cN9chBnpwu24MgQhFpLPT9EmHokN6LT6tQII846BMDqrMGVd
         fqjZICc874fg66EEkfWncoKoxvannnfP7akQCzsrun5JDFek9in/k71DsPRcUpv1vVkI
         jSl9rXsUKTiN2yNXho8JSRuFEm1kG+x2lio69gT11y69YcGNTiEDUDGRWP5LJNHvap+z
         kazVq/CGVsQzUgmYTbsx5CfxWBP/03QuVz8DhzenzN3aYHeHWk3PmG7xO6DrvDIGPJT6
         v1F54ty3sH7O2LZwpQhkY5hk5hepYLT5//+kCUhWgQ2UIBR4FaaNy2R0zh8mRTceqy7K
         jwyA==
X-Gm-Message-State: AFq9FYJ8eUGSSycd6EZ0q4D5rDK31Kq6RMUgf6EZq3TkKpQDBO/s6xBS
	OaWpKBmxPWyf8N4vb7mlqvE43vBgrNRGvb+qth9sABmdhm07bXGHYNUULo0p30OdKWhgABqdO10
	WSi9joIRmQbhsprOItgNIe5+rzHxjaNI=
X-Gm-Gg: AYBFou1Qbvhxiwe6YRCX51nbTAVnrq/Q4y7aR7oRdB07RPZNMebAtiGsYHVwySgr4af
	QMClF3dAkZmfzaAeaVtR/zevVqc2ev/HKE2laQ+1txOcnLPxG8uJ5Mv2gud5jget+k42heP7dbD
	K2wONVSL5fCZ9OaRv713XetlKjpQyFSqHJX4ufBmUEON9yLL6oWRxUgHTSG4F+B2mw+6oaSpkO5
	5HvdOCoFD6xxOeh0g/CfC1Mh0+B2UphTv9rU9nsJVorOZlDGZfEde2k+bMUZDz6QUxtpJmYAU1b
	bPZxvYWbrpSMN5q6bBWKBUow9MkGooBpNg8UWVilqK/HefTvk25jbIy/jlwp0bpLszzifU2zzG0
	yoXMQ+1ebP2kFaPD1bg9zsV/KsdVE1GqXlULLVorD4bjCFTY8kEIt8N9TITjc+g/5YabaNQ4=
X-Received: by 2002:a05:7301:640b:b0:36a:30b:5dce with SMTP id
 5a478bee46e88-36a2044c340mr1844568eec.19.1793158801947; Tue, 27 Oct 2026
 20:40:01 -0700 (PDT)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAEFUPH3_w2CNccQxr70qi8yv9zbcN9a9FvOt98m9vGvBL2H_pw@mail.gmail.com>
 <10a1cb15-d3cf-4a87-88db-87177fe60ae0@rowland.harvard.edu>
In-Reply-To: <10a1cb15-d3cf-4a87-88db-87177fe60ae0@rowland.harvard.edu>
From: SIMON BABY <simonkbaby@gmail.com>
Date: Tue, 27 Oct 2026 20:39:48 -0700
X-Gm-Features: AclHuK_8wiof404OSx7RWSdRr4r4UCuNP_Bn3-eVUpSBG8I5Aev--ImWC4SKUs4
Message-ID: <CAEFUPH0gM4oKAcRHr+vWO-Tat=BL9Ow4NSrsOeA9UREdCX0bEQ@mail.gmail.com>
Subject: Re: QUESTION] EHCI async QH/qTD lifetime on old 2.6.32.y, Octeon+
 with ISP1564
To: Alan Stern <stern@rowland.harvard.edu>
Cc: USB mailing list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Fair point, and apologies for the way I phrased the question. I
definitely wasn=E2=80=99t expecting anyone to remember the detailed behavio=
r
of the 2.6.32 EHCI driver after all these years.

What I was really trying to ask is whether the failure pattern sounds
like a class of EHCI issue that was fixed in later kernels,
particularly around qTD/QH handling, unlink/completion races, or
DMA-related corruption.

We are currently comparing the EHCI changes after 2.6.32 against our
old tree and trying to determine which fixes may be relevant. Your
confirmation that current kernels are not known to exhibit these
symptoms is helpful.

Thanks for responding,
Simon

On Tue, Oct 27, 2026 at 7:14=E2=80=AFPM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> On Tue, Oct 27, 2026 at 07:06:21PM -0700, SIMON BABY wrote:
> > Hello,
> >
> >  We are chasing a memory-corruption and stall problem on an embedded
> > system and would value your view on whether it matches anything known
> > in ehci-hcd. We understand 2.6.32 is very old, so we are asking about
> > known behavior, not asking you to debug our kernel.
>
> You're kidding, right?  You don't seriously believe that anybody could
> remember the detailed behavior of a complicated driver from seventeen
> years ago, do you?
>
> Or did I misunderstand your intention?  If you're asking whether
> current, up-to-date kernels exhibit any of the symptoms you mentioned,
> the answer is: No, not as far as I know.
>
> Alan Stern
