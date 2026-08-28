Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB87135F161
	for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 17:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787938592; cv=none; b=VDGmkV+3LMX/trgZgkx0YOjgLV0Vgbb9abKL1LNKSxl8/D034u2qapwE07Ce3tUGiSOUui5OTtpJapSlq2i7+aKyoAMKOUzBYTJwCEKPt8jnzvAP1Zv5s/lOi+tZpfi+anP7N7F76CQ/+oAxDPWLwX6sF/JIAj2eHUkr1DVW0wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787938592; c=relaxed/simple;
	bh=jv0AjUOxCF171zZJfjT0vnjOCmVzRRYbyifCCKJuQUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A8GU2vwD2sJCclChQs2K4l1q+aB2ycW+aVBUYvcBvYZ59EKYYXv/BdMYF5QgcMTHgKHdtJC2hoLJI+wuDISDUDCzafDRByYpeaQfka+ikAyXlLbCg5Q8zwVpiu52/ziqucG7hfq+UHIs0SgKXB1EsAUYYHmILoXCbRWVPT1NQOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cKbHmzyl; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cKbHmzyl"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39faa67fab8so9674951fa.2
        for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 10:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787938589; x=1788543389; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0RHnXtY7z+uKbpCqEZp/RNcyCgc1KO2CwFepDKXPyys=;
        b=cKbHmzylMcsknunK4oaXPfxkivH453YxLmPPrzRcpXmB3JFxXKgQftlE+eVjrUf0d1
         C3x/VPcnxTmUMO3PewqDY2XmGyPeT2nfHFH1RS1+cUoaZdLT0VTwlZ0NnXeL9BlH2p5b
         fFg0q9x71oQOMrWzEoKkTgm7mszBaK5U9n4I5PvxFTIGEYEgvvCt7ht6iyjY0THXDZZg
         fwjbx2I0Gz+ZMmDoz6Ck51+aZ4/qqkH3n9hi7tRnKyDKDRkXfzO6iPRs57GjRStKb0y7
         hoSC6oNYJ4BO/+C6j9IG0Y3mi7k6unf91/hckjsjrBmM4Edj+slMQdjUUJTLWyLJAV0a
         wfpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787938589; x=1788543389;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0RHnXtY7z+uKbpCqEZp/RNcyCgc1KO2CwFepDKXPyys=;
        b=eNWmyHWN52GqpnvUC/wYHe6uYiiuyxaTgl/LBehqQCpkT5K2K8i3yJaaT20JXh/Nay
         aJrWjf5xLuJ6rQDrp6D7UUH5xcrMPMBnMd3imtn0M151S2Vtq/wYw0XhfbaUfV7GLYu9
         wKZEpZce2E6bJb/T3+cohHTtYfcKbTBuHlGtRPLsVBKYm/ilA2bpSvlmGsT02RjcAII8
         zPyc+eWzJMOAinJdYXrgQ15EovRwxyG+1Quw8rOrpALdLJ7iyJMS/hUtUquczQOmTgWE
         z/D/Lc2+40o9yYnnHF2uh9Rm42B66zenh937iJsRjqehVPW1NMwIeL3v8d65RIFnFZua
         1vWQ==
X-Forwarded-Encrypted: i=1; AKwUvBzqVEMvclH9HhKQ2U4r8q6rvEPeUwaCWmTIKfa6T+YNuqS0Pqf88l9UiCu1NQ/JNVqYuXfG1FOP+tQ=@vger.kernel.org
X-Gm-Message-State: AFuF++noNc2DzYrzxVr45NISJ8a+6tGVAPvIl3Z6I/e53NKfTvm/DSdv
	9BEFTsHBtFRwNBYtH6yIVAw20QifkRAw6bKNJi7tWyqeuSNwuQ1EWJJL
X-Gm-Gg: AR+sD13Vc1KA+/hDTraE/5aeNysjYtjXzD0m1LPtKlpXdkQL4a1vwVSI/pnL/ynNg+C
	C46Zb5fyyjr/HD8VA5Vefyayt8RXaqIYcMRn6DJyb4IevwrfbmgKC+5dsGw3KOerE3BUsWTztsb
	oxhIvzYnX2FSqFzD25HW0dKmu9TVn/LPMP0JKoumIzjHu4fWftHr6jFGYhtZaXtt9crb8CjN6ng
	9erg5g7q1ppLwHZZ8tTLICQPXi3V14dGRjMu7TLdSlmpvEot+hqGDuWBP54KJvOd7uiYvk5KwlV
	BljSexG4REsNTP4Sns2m9InRIenSO+ruGfAUzPrNSQZ5JtzTfhpx58VrsLXTtinhNMgCb7Xtw6Y
	EZOZXRlganlPg7DAgjE9EV5Eq2ExTw/v+XWuenshFW4wUgW42sQWGdKSNd4PoU2Jqd3aJO3PyDj
	dAMt/NAthn+6Tlnu2sPWgQclCpqolf6LaXaul9HlAcSTU8zBz0bxoAMrgWyjFh
X-Received: by 2002:a05:651c:f1c:b0:3a3:364:f796 with SMTP id 38308e7fff4ca-3a30364fde5mr15364841fa.1.1787938588647;
        Fri, 28 Aug 2026 10:36:28 -0700 (PDT)
Received: from archlinux ([94.229.16.221])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a30783a8a5sm3064181fa.33.2026.08.28.10.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 10:36:28 -0700 (PDT)
Date: Fri, 28 Aug 2026 20:36:24 +0300
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Zongmin Zhou <min_halo@163.com>
Cc: gregkh@linuxfoundation.org, kees@kernel.org, david-b@pacbell.net,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Zongmin Zhou <zhouzongmin@kylinos.cn>
Subject: Re: [PATCH] usb: host: sl811_cs: fix memory leak on probe failure
Message-ID: <apHG0Pq3HagSo5BT@archlinux>
References: <20260827074120.49006-1-min_halo@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827074120.49006-1-min_halo@163.com>

On Thu, Aug 27, 2026 at 03:41:20PM +0800, Zongmin Zhou wrote:
> From: Zongmin Zhou <zhouzongmin@kylinos.cn>
> 
> sl811_cs_probe() leaks the local_info_t allocated into link->priv when
> sl811_cs_config() fails: the only kfree() lives in the remove callback
> sl811_cs_detach(), which the PCMCIA core never calls for a device whose
> probe failed.
> 
> Free the private data when sl811_cs_config() fails.
> 
> Fixes: c6de2b64eb57 ("[PATCH] USB: add sl811_cs support")

The code looks good to me, but I have a question regarding the Fixes
tag.

In the commit you cited, a failure triggered a call to
sl811_cs_detach(), which freed that memory. However, that behavior was
changed in commit

f8cfa618dccb ("[PATCH] pcmcia: unify attach, EVENT_CARD_INSERTION handlers into one probe callback")

where the call was removed, leaving the memory unfreed. Shouldn't that
be the commit referenced in the Fixes?


Thanks,
Nikolay
