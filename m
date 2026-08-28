Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EF4375F6C
	for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 11:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787915962; cv=pass; b=ax5JabMKBq7rifoU3D+aWYxxX8bk/9l6L3UhhXhHYiHnzAmbO0R6ldGhP3uIy1cgUCAKc4wpn5EkpVuf7I6mMd4PgCdrGNArVhcX4Bu1NT9q0RPGICg/SXtS4ghP6Phu4BFTKnccZFlFYBimFeqeFdTJ1W4/ZhSJ9Xh8Jtl8DPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787915962; c=relaxed/simple;
	bh=QYvSa0bITS46trNZt8jRRzM5UlKEPCTWXzhCtYA37gk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YxcQ3XXSayk7eHxZrT0Hkn5H2wBFc4hDm1gLMZPc2LDhvzyu5Dl83Bf4htzBfG1w7RzoKP+gn1jMqMdHqAUK0cDucD1QdwAQBCe52tk2tHKe8T4/8TgbsLfzFISpF8zeEK8XooC4jgW6YJR1+sqz4dRQvyO1vdBcZq+sWLUnZgE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=iHtCSZqu; arc=pass smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="iHtCSZqu"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-39682983a0fso962359a91.3
        for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 04:19:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787915960; cv=none;
        d=google.com; s=arc-20260327;
        b=baDtBbiDidXIccy7g2yeGoH3GOX7jhzg9F+jf3OVsEtMVjG5BTFy1hGhWWomRN/7av
         w5VY8bhSePk6VLgXtgM758/lZufgpvG4/qzb8lbVHiFNGU+gQV9TTXZePMAdj3rp61wj
         AdFfveZE83Bj6HGqQNMS+Q2RS0CzqSn9q2VTlBbQTtabRl9EwYLzySy7qrhT/qSYGdkG
         2/P6SW5aYi5JtdmLvZQa1eVN1dgxpCcVIYR3fvkrjBS86Fsm1F63ZWVxOkWbSHbCKS8U
         335rngsot+u45RDXUeTa7u3lW9Y5DrZBtsweF8Bvx7fBssBC24kLMRGjXW3SFQRWlIrp
         B1qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XHV/c33+UZ0gfJQBaixU2xMfyx2z6ZYTrHSRI/+UPHM=;
        fh=mHNYxdp/dWDRXuJNINzqOCgo3YV16eI3vaMg4aohTSY=;
        b=A2E6ajC/g4iv/YK8zzQAcPuMcuzHPbkE9M+LFYYAFl/6rFqubkNsshiGzkrtjUuadd
         7IhKcwxujCe/+lBbAOsCABBXVpu6mzp/GeoiCX49+a84y5XjZp2IL2bbolULqRO7zfaf
         pYrlW3uPVt1RLy06D7VItl3urUasIh++iE1fz+qaE6YjGYaYlm+/XEoUM9zIGZ9WX96T
         kRVj05BcLYs1NLsY7GD2Fd7L//3SqJO7ans1HosCv/BIRibSNiTnXf4Dx5L7nciW1VOG
         pP0ZGV2PrbrsRVfD2JAcNcBke21bUJCP9QR0JgzouGklz/jQJanExyltOKUrXff5ue8H
         kb7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787915960; x=1788520760; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XHV/c33+UZ0gfJQBaixU2xMfyx2z6ZYTrHSRI/+UPHM=;
        b=iHtCSZqul6qJ4lb1BWwAQQLUbvDidXlS3PaNogbQTV/GBOFSPFqdu6dhfEHPviN3oh
         KonET4OLNSqV24sOl3Lq2BCW+CbfvJB+5F7r0Mh29wPHpFO9aKhBCYCNx849DwleSqU9
         Nyitm4x4HzczanZQxBb2+94/RtTTjkm5YbV/lGN6vVLTBt101W8DuIKbLX1DFEwMjP4i
         /2qQZWmp9UeAytbkmqIuOJtvPzuz2M9D77Jinh3VFS3ezqhM5ntPYQW8bPahufInqCuC
         Jc3w+mLQeIxgAp0deA8uQiTVE7RiXQ1dgD4iBi7MrRM6B1jspfeuDW1R0kex4hqp3109
         s/DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787915960; x=1788520760;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XHV/c33+UZ0gfJQBaixU2xMfyx2z6ZYTrHSRI/+UPHM=;
        b=DdZa3uUSR4YtMS7MFjG7BNWrwlClTlbPnGap/jVt4a6kuPzLygp2iaRl1eR6LpbDcD
         AvyNc4b32HThaVWPX+6697r1w2gwoBblGxii3upQif2xjNVBUA9S9lPenqO9tAQwYn5c
         xDjcC1Q7KVpqfKk+liEbp5V0HplvtH43RwcRtMlAxmdh7aXotd+gKJbVBbogn1574Kfi
         5iPwyO/RBFhfTOYMhKhdu6RBvT6ox8q2BQo0X7BHATKzkxbd+mnD2GgRnuC3n31ZUDxz
         yZzALLKpNpHos8bUcARBZpj0c8b8IRcyLBLcrsZmQSl0im/hlHPpXPTZkDe2Rx9nxZt7
         e4Eg==
X-Forwarded-Encrypted: i=1; AHgh+RpffidgLWnuliR6OhAbGp8JlfoUj1Sl63Bn17iv5h4kGIE7yFn/zYkMMGUFljTBTm+t+OYKQYbOXI8=@vger.kernel.org
X-Gm-Message-State: AFuF++niX6xod58Kh/8lQ3Kw3ux4ooigRKiaZGuBFV9p0hJig7z4it0V
	NVQakE9ZMRwhVN1fgXxD9wSuQT4ymtlerLgj+9+TNBM9ICqXBxvmqH145Nnl4kvKAqRWdhY5lU6
	bcUmmXlOb1jjiz1fUrkg7hvat0YYVUqB7kSZbKiXa
X-Gm-Gg: AR+sD10aswx7K08zh2YA/WcCVsGnEKAYqPsXuu1nCQ42UQtCrGy7uajvjuTw6AvmuCV
	br/btb18OwW2/lVmnH9El4OExB7kN5svCbe7ZuSDZhCT3y8ns93FiOHVR6id9yNx+/P11XNMIO6
	V54XGbJxGoXJ3JlWd32YmC/xkk9jexVsbarXEG/tAgklQAoQ06Uil4jccI+5zqeePvZZrK314bK
	Sn0+Pe/YcMpisd9cAGLminz8ir8JxyrklPm5kTKEJ2G1LHiMeO+MbHPcAMCJ/Kp6kFLdQjIVsWp
	ndiBo6rmV8+wRvYNi9uvy3iBDRQXy/YP8jfIaal7k/9hMejO8lP2NIbH5LYWR040qXP+4nZauu0
	ufJz+5e/mW0TpHnngnHxPY6cYHw9Q
X-Received: by 2002:a17:90b:3f50:b0:381:a766:efc9 with SMTP id
 98e67ed59e1d1-396d0df72e2mr12544716a91.7.1787915925380; Fri, 28 Aug 2026
 04:18:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+0ovCi63OBqOySpNgU5xND840CDhi3B1dp1QsxhmcOOo-7w1w@mail.gmail.com>
 <2026082817-trough-wasting-29bd@gregkh>
In-Reply-To: <2026082817-trough-wasting-29bd@gregkh>
From: Farhad Alemi <farhad.alemi@berkeley.edu>
Date: Fri, 28 Aug 2026 04:18:32 -0700
X-Gm-Features: AcwNN1W2M9DEag7qNF2zcfc89TEMPyYwDUox742H1H1jepKnzMWTt2CUyAQ4W0Q
Message-ID: <CA+0ovChRcs0scwASAKRdeZuTJS6KyA4g3JpoTA_iCEPXZK3c8w@mail.gmail.com>
Subject: Re: [BUG] ci_hdrc_add_device -- KASAN slab-out-of-bounds reading a
 FOREIGN device's platform_data
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Peter Chen <peter.chen@kernel.org>, falemi@asu.edu, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Greg,

We are not sending more emails after receiving your earlier set of
messages. These are all some classifier backlogs.

On Fri, Aug 28, 2026 at 4:01=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Aug 27, 2026 at 10:34:56PM -0700, Farhad Alemi wrote:
> > Hello,
> >
> > As part of the kernel research at ASU's SEFCOM
> > lab, we hit the crash below. Crash reports can be found here:
> >
> >   https://github.com/farhad-alemi/public_bug_reports/tree/main/150-usb-=
chipidea-foreign-platform_data-oob/
> >
> >   BUG: KASAN: slab-out-of-bounds in ci_hdrc_add_device+0xb76/0xd10
> >   Read of size 4 at addr ffff88810e9061c8 by task repro/9505
> >   Call Trace:
> >    ci_hdrc_add_device+0xb76/0xd10
> >    ci_hdrc_usb2_probe+0x22d/0x370
> >    platform_probe+0xf9/0x190
> >    really_probe+0x267/0xaf0
> >    __driver_probe_device+0x1e2/0x350
> >    device_driver_attach+0xe0/0x1d0
> >    bind_store+0x1d0/0x220
> >    kernfs_fop_write_iter+0x3af/0x540
> >    vfs_write+0x61d/0xb90
> >    ksys_write+0x150/0x270
> >
> > Our reproducer.c is available upon request.
>
> Why are these still being sent?
>
> confused,
>
> greg k-h
