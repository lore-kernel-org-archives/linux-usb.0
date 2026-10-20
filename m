Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792526122;
	b=DdKd86Go6wkTnWeUwv6AsSqhMzITwaanxrEqiWH4WwvdFWXAtLfhXcnmxQ6e6FAYCbDS
	 DnSBmM7j0D9aBjTw+FqecwCgjn4ENCr7tOIrIRULN73guU+M/jTLXtG9bI/9w3dq2S4m2
	 UzcsVJyBrw0/rJQcxGbZAe7ckUMMhsH77v/b/Wy08ccmQQaWl25OEU8lnHAyHUNTd6eTI
	 ZJNBI1s429YfkK0+R40ShqqXIOXxIgnuZg8ZfDDpN2rloCcRoa1zAp4g18zK24nDm1UQV
	 dZ0fRIBzCOS3R9l2rY1n70p11+L209yBPg9IqhhD33nnTmi60FOEB17bDPKmNGDuG8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792526122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=DC5Mr95KOFv3KF2iAi8A1QbvNEAK4XEA7i/Tzk/Q3Vw=;
	b=hugiBlMWIXxyoMC8HktK4kS1TLSR2VJ93R3Ym8+t3iuK1SjRLTNGboN+YIzMDQXxonVT
	 BYum1blJmw0Ho0GMnl8brGn4md4IAQw9lK/3WMMov4jaiQupRa/CVjhkf2F7irlV0fcdD
	 el9vvo+Jz/HYlAZfSTR9xyx2GkAFJNITbILA8fsu1YbYpUYAxYgz16nMpBkw8mtF/o7lP
	 7HiPRzBsUlzYNJNkHqHPfFSfQuJ1AEgPty6Qd4gZg4ud4KubZ6KvqIXoCW9UD9AA8tWwF
	 gOUIJTZQXGl9JJtu6o0uzHWcSYmU533J2CRgilm1A7m03g8CestEYxtrcc2+gL8lx1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=ho0OZRqL;
	arc=none smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA49606A319
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 19:55:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEA49606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=ho0OZRqL
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5364648ae07so526301cf.1
        for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 12:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1792526121; x=1793130921; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DC5Mr95KOFv3KF2iAi8A1QbvNEAK4XEA7i/Tzk/Q3Vw=;
        b=ho0OZRqL5r4eCjM4AkMA34OzsHIanDDPh2NtnMmtdsc9djpMFgiMxqjzzu5D/XkQlb
         SWoD0Fqji573KIYf6/nXchzgpptoGfx9N0euiidYldAZ7BLbEPDa9EyMLKgBAeg7E5sP
         95SmFzyBHSd94wz5Kl1wE9Jia6cZxTAlga++tXhM6ORfOLBya5MnUL8Z3LR50upBe9Ap
         Cfn56zjTXQtMQy0dTjzklZrSd81aPLxla+oaUvAFOhbAAXJ0KmbnspMgT5JfdLBZkubx
         3SoaSNF5ZNS4syu5PS4+G1dATjaT9iiR6glwxobUedpVWKVqHyh8DKby2DImkFvdnzLR
         JvMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792526121; x=1793130921;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DC5Mr95KOFv3KF2iAi8A1QbvNEAK4XEA7i/Tzk/Q3Vw=;
        b=Tlg8jRstOdkt7025WhYPjUKpi6oH/zYfgMfZRz751m0Uj4NMsmBHnlBYzZ0yOoSSaz
         2ON34qDoHYXd7Frf4w5hJYbYs06jyX0oSqbVrhULNGi081lIGDQSG4V0pHmGp0QPua8n
         J1/jjOu2pE6h8nDVIKko4OoaTENficwLNfBUqYluTzpE+u3rsmhNoZGOR/lc7t8UPNGP
         vnZBYPSOyhsNFX2ET2L58A2qEFMj9YVFz2J9akBJaxQJBjn7orowOqbrdPCRhiKZ1FKc
         WUeYMUkJob3KshevjuaP04l7UaiRlhrfuoREvwNUESufqtB2X5oiY+LzmjBa2H8+oGq6
         UJvw==
X-Forwarded-Encrypted: i=1; AKwUvBwUsTbr54WKmBHGBXLM3f+0YLuaZ8Raq+hNuES28sEd1eraTumxfEFnzfRu4+RQyVEluAhMziN3mvM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJGZk28olFzlpqy6fcKX1cqcbw8iruEgTNs67CqNcUUsp//HDVw
	70oqxhbM7OCh6Vu8FSzd6UfOEnP7+G+iR8c2H8rRGMQIODlMppupnohLnwsoMHGerg==
X-Gm-Gg: AYBFou1n00PncfsUD+hCYhL/vcL+gnST4atqfwXpG/ISylnf5fCePbxEfVb22rDRN23
	o5D7TQ2UFX8CddkHLllsKRPOURzdoQEdwdWGEZqQ2nkwZdZ9yKZQGZtPB8h8U3cshbC9BBo0vcJ
	p/eeMIPda2IQm3a0N5U8J6VvHgd96vSD/32yd+W6DFzoCjUkvEgKrg0AOeS4FuWb21CphSY7AnY
	1WeVFpUlPspTIwSs4I6G5ehbQJd4Iuif9owdD2R6XYFhg30LDya0hwLGo8uvQtCzjI6eTH9AT9A
	FM3JfmcQE89lnwgDXaZXhY1Ustk5nrQkaQWq1C68rEVc/Ge5MJqaLXYoB0apij3LUYtiBUD8A0u
	U+znYk6V1sE21qsRf2lnyxo8DOQrOZY55X17JE2CBfvYQUHXQ2GuYdoQPghH7iRKWBzJr2pb7yT
	Rh5Gt/x6PH9NAxxnixJm2/YZ5dioMZhzN21QRnLa/B3y1yJcFo4eBLxruTUW38Mjt32NggG03A
X-Received: by 2002:ac8:5f13:0:b0:536:7c84:be60 with SMTP id d75a77b69052e-5367c84c62amr86451461cf.65.1792526120653;
        Tue, 20 Oct 2026 12:55:20 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::4791])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53698ae7fa8sm3806721cf.9.2026.10.20.12.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 12:55:20 -0700 (PDT)
Date: Tue, 20 Oct 2026 15:55:18 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: hcd-pci: avoid double disable on surprise removal
Message-ID: <01f4dc0b-8ed8-46ce-9ff3-df811bd4b84f@rowland.harvard.edu>
References: <20261020-topic-hub_pci-v1-1-bccdaef0344f@oss.qualcomm.com>
 <a25e2100-e01f-49b7-b794-da1027dffedf@rowland.harvard.edu>
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
In-Reply-To: <a25e2100-e01f-49b7-b794-da1027dffedf@rowland.harvard.edu>

On Tue, Oct 20, 2026 at 03:52:28PM -0400, Alan Stern wrote:
> On Tue, Oct 20, 2026 at 05:05:39PM +0200, Konrad Dybcio wrote:
> > A PCI HCD can be surprise-removed after suspend_common() disables it
> > and before resume_common() re-enables it. Avoid a second call to
> > pci_disable_device() in the remove path when no enable reference
> > remains.
> 
> Does the double disable actually cause any problems?

Also, is your patch any different from this one from two days ago?

https://lore.kernel.org/linux-usb/20261018164134.134106-1-cole@unwrap.rs/

Alan Stern
