Received: from mail-qk2-f24.google.com (mail-qk2-f24.google.com [74.125.230.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121994307B0
	for <linux-usb@vger.kernel.org>; Fri, 25 Sep 2026 13:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790341578; cv=none; b=n53iZ2yk47MCmfxG3n7Lt4MnDhE8SuS9aPk1ZBZcH9tx4lTlSfOVxvL/L2Sw/ellMz4d4fVUO/ZpL6ZwrDRITDJD6KtxuFQXQigfDXTwqVv8zv0k09AqZgJatZnyAoiGmSJ32ODpfcYH9BfySn2+KOouK0aPANs2yw/D1VlrLOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790341578; c=relaxed/simple;
	bh=fZy3WD/4I7q06z0udqV0Y2KuLVYNjasZCqshP0rmK1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S+znXxlllQn6loF36bk9ZrZgpoGQIiz4zTfWycf6yUC8arb2fOScCPj6Jvn4Eq9IFrum1VFLomQImU2aSYGqVJqtcIN2i+dLixcamIGHSo0x/nYRscRLdHPDIZVk66CBYIfek2mAOUGBFWBv8j++pZYOT7aePUNv8sRjZ2heHps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=KCrV1v2k; arc=none smtp.client-ip=74.125.230.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="KCrV1v2k"
Received: by mail-qk2-f24.google.com with SMTP id af79cd13be357-939695b5741so86019385a.1
        for <linux-usb@vger.kernel.org>; Fri, 25 Sep 2026 06:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1790341576; x=1790946376; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UbJuuu9rDcNK7YTFhNMPD7ihrL+i+rjdSV8clEiBYME=;
        b=KCrV1v2k1qa97eW69IXVGbb4P46MPjw1uX5a5hU2CALfqFKFNgrT+L5IO7zA1xzrRa
         BER70tF76Iu7O3eT1rt0dJRwKMNNYBthPxZY6odtuSgmvuXmwdD7/6m+pGW4BUMuM4GF
         jIyywW8dZcy+LCtbdyOM+Uc8jpLlcrO2eETm61vmF9T9HWJQJZzavvpIg+PMdD21zIX2
         ri5Jmzm50BotrOzxkxRhGHKJI0vlUhUSdC0jpZi78XI6RNvqKgRiJ6is7/mg7RYTC9vy
         LHf3XfAzeRUBRSqHnYqzaXbbKOJ4U3EtPPYQZRLGFs+V5Y1aTgtm3f/D72ygL48oMyKj
         /B7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790341576; x=1790946376;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UbJuuu9rDcNK7YTFhNMPD7ihrL+i+rjdSV8clEiBYME=;
        b=05YV7T1l28sOYxvxnOp6/2IMLag4iTm9DErn8LyLvvqGEgGk3Jjpj9TS4aj3ck7H35
         cRg/EfnrYZfg5gUSV7owtHxgYg6S5O4vjN2uzs9DQSOlOFJvH1AsDKwzVCGbpUAIuv+u
         z1zhcTP7gT88qI4bdWT4FieAvWFVmEmsk8j9LhnJjvln2d8UJyRz1VGBL1cwPiQQGOq1
         EAGe6cBzrPhe8syQKHb/DvkokJARh9ltbkZg3tTGp4XAQ0GGNHs0UftXMFklkKBKSkGr
         c+3hy0VCIbSEtCWEnpn1U2WTEd3RIYd7VS9wTLfuCs8bg4DWd7WN3qVf137CrkHl/GeI
         5+zw==
X-Gm-Message-State: AFuF++lDQXEPuRLJrtrfXZv34NdejvrPuoPWBtYtFdjtWsH64G9Foguc
	SA10e4xfmi25Xd+SvFQ1bc10O4/TfaYw1hTzfHwxjiSAO9CLIKFg3QAinCdKA++P0W6N2V4O9NX
	teZUyLA==
X-Gm-Gg: AYBFou3QMKgWlVFvH3Mr52Ob2Ci5E4AdhnUHpJrbW4MPZHevV/E0mIm1eVhU4pBW61u
	kI7Zhu6jbYaJiAQ69UbaT38CK2zGm8YOhQmNZ1gp7htW4havRqjQzoT/CxikYwqzpSQD4VA2Rk2
	+xld7y87RSmffxMfYttdJ4IEpAqnwY1En6kT/s0jnZdzLhYUNlRutAg8iSUomYfYUGASgBTXX/0
	vC3zZFuMv+z/ohDNaT82vUBGARRYXnKjyZcE39P46uIoEg6Wa3ZxrJP4ocU8tNBdl9r0yuxnFMp
	+MSVilFZD69B6Wg6QPaa9Mee6vJFIbvZajmjpZCsJRWfH13/dYs5hWTbOgs8D/8+XIC2q2uFDB8
	T5Dk+orY+6H6mdnVQu7ahAZKH+Guj+i3HPw3aPZBmj4HmkV5gL+cHtisns/Let0QS48vWRTKdU5
	QVOQYc7MDqjNuiWEl/54UsPP3jsiN4i0jpgWeN93m9Vg5ruYrg5YDAmFXH/JAuonLDwGHRHuE=
X-Received: by 2002:a05:620a:294b:b0:93b:d79e:18ff with SMTP id af79cd13be357-93c43d4ba9bmr446059285a.66.1790341575380;
        Fri, 25 Sep 2026 06:06:15 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::1b7d])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c448b06c9sm176097285a.11.2026.09.25.06.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 06:06:14 -0700 (PDT)
Date: Fri, 25 Sep 2026 09:06:12 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Johann Klammer <klammerj@a1.net>
Cc: linux-usb@vger.kernel.org
Subject: Re: possible regression in usb-storage?
Message-ID: <986f81b9-c195-4ef4-8176-ca69a8f506c4@rowland.harvard.edu>
References: <79f2c208-bca0-3bf2-afdd-3bf095ff7b31@a1.net>
 <ef6be2fd-29f7-4577-a229-35058bb9191e@rowland.harvard.edu>
 <18c4b811-e91e-c163-fe1f-ee081a00602e@a1.net>
 <28d1f995-5e4b-4d01-aad4-6c5626e51e29@rowland.harvard.edu>
 <d0cd9a1e-cdb4-97c2-5bcd-1bc9f5d9173c@a1.net>
 <5ab3e86c-f209-ca72-58e7-8ea56225775b@a1.net>
 <f66b21bd-707b-4503-a40d-972832db130f@rowland.harvard.edu>
 <605c0845-cfd4-0702-4322-53d9c8037b70@a1.net>
 <be5899e3-3e3e-4977-e4aa-32ca368f06cd@a1.net>
 <7e2440cb-41aa-3429-fb6f-b0f4cf761029@a1.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7e2440cb-41aa-3429-fb6f-b0f4cf761029@a1.net>

On Fri, Sep 25, 2026 at 09:51:14AM +0200, Johann Klammer wrote:
> 
> 
> On 9/25/26 8:20 AM, Johann Klammer wrote:
> [...]
> > > [  157.965753] sd 5:0:0:0: [sdd] Assuming drive cache: write through
> > > [  157.967330] sd 5:0:0:0: [sdd] Preferred minimum I/O size 4096
> > > bytes not a multiple of physical block size (0 bytes)
> > > [  157.968382] sd 5:0:0:0: [sdd] Optimal transfer size 33553920
> > > bytes not a multiple of physical block size (0 bytes)
> > > [  157.969763] sd 5:0:0:0: [sdd] Attached SCSI disk
> > > [  310.080965] usb 5-6: USB disconnect, device number 4
> 
> On another try I can't actually reproduce this. Must have been a one-off.
> *shrug*

So is it working or isn't it?  And if it isn't, what's in the usbmon 
trace?

Alan Stern
