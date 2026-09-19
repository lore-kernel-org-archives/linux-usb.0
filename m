Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDF82848BE
	for <linux-usb@vger.kernel.org>; Sat, 19 Sep 2026 00:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789777702; cv=pass; b=s+D0X0EPixHVCX+Mfb2ndQt0tRzRrqH8NqAunpyipwgpzSu4bk84DnuZWPFEf56iaVXDppwwx+pGke3poTNO/aUtz6CKyV7hhBYkxOnm239BEIbUKFJOFsIsLIPfJijGd78lZSZemyhYatCQkiSg5d/VksGKP3sW7/H1s5gL9Ws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789777702; c=relaxed/simple;
	bh=p8cdSyQO94GGzOQVzj2WmA2nBHGOBX9Q4R4Ibyw3LiA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N9nq4i6kaJOSCJthiiGAudgtejhDICdehnJ2RXWNyeWVYgiUmTJKImZ+GCUwCc4g4NZlxtxKMAuyFsSKSvwwvzDkdMPe+9V30dSdBx5ifTluvtz2FD0sGLgtrMRIv2ELeinBw4cH/Fp0P0gjfCu/kBYVCTuhSk9dSHKIu7mlprU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qD+LaU9b; arc=pass smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qD+LaU9b"
Received: by mail-oo2-f43.google.com with SMTP id 006d021491bc7-6b1ae7166ebso682951eaf.1
        for <linux-usb@vger.kernel.org>; Fri, 18 Sep 2026 17:28:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789777700; cv=none;
        d=google.com; s=arc-20260327;
        b=NhRW8fbHakFapGhz3DEQTNBE+ItY8WwYo/Hp+iC5CVPDl+G0ryFsSoJoGsI17K3p6L
         KHGkzcjB/X5wO0T72M75qoMlLGNzYg2ImSF053NdCpPI88zkgsotDC7Dyydkndx5XKaz
         HPLVnjPtCgrHFz4fHypliC6uX3u5qSyUDO8tmkq5OGu+ILTAuzsMdOoFmhoYDa03W92p
         PbZhSVKa24Vu4T2MscmenMXMEShuQwWJU3qr8SUdsNAQtzhXeZOTPUgNhUu+RIVimjVt
         7+FbhD35jlkQo8UZu08P0yYflJJd0daZHDsrx+9ybRuprc3q0yxTXMpcLm+5pXnIUQq/
         krcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=p8cdSyQO94GGzOQVzj2WmA2nBHGOBX9Q4R4Ibyw3LiA=;
        fh=bKgBQo3W9BJj3FSVwsqaNhv2utYjesPAie1B40yXZbQ=;
        b=MG0QUGVf/cQc5iKB1sY410JTBfyaS2gvz16bQUWOHlOhdG1Fed9HOYQMznVs3LxtjO
         TnjnXQG0K3lZnpoy2IVr59QPZYB6g7ls1ujhURqx8mbYT7CwdCA6KtQJw7QcrGfrKKJO
         k6qZKYO3uKQNUqJ5nfI+8U+Z9DTPDeT5ETXLwl/4XyKCKWA6rZZSSnspYcnOmzR1t+RY
         NVbfzDLcCi/uZDizDgoz55OXf1NqLh5Icqqct6smREKi3WubJ7NGsvQc/qJF0Fr1sw+p
         5uppzspCo3zXPdD5oL0yZpU/IlSVXoIygEXAqEc4hzZUvRQBiTe/2bVeN00jS8mdHLM/
         tGHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789777700; x=1790382500; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p8cdSyQO94GGzOQVzj2WmA2nBHGOBX9Q4R4Ibyw3LiA=;
        b=qD+LaU9bhx6gJmI+aRvZNU38neBvmvscSA48xyOkwAbwQG/03pGUU0blrRQeQFycpe
         r0VKuo55vPMR4OAwqB0Vu/MoLD4Z4yYe2L/xeV7b3KaO5bnjncBvofuqKvQV1uwqCJ4E
         /JWER0Z+XDuqPMnCEelInG8XJxi/jwRft5iqruQDQ4APy9dNXhlso6tQESK3YzQLvNp2
         DNP7ZtQmiHbWpAnXnpwEpJZzc5mKumIy68kqKnJkfB+8JVATxRG87IJgHkvLfVzeE/WU
         Tm+32vttzuCeW/0RkZHGb0BPRNaovZZ+Yw3JgGNappT0RnvUrBIbuBB+fqBFR3xyOu3D
         ihnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789777700; x=1790382500;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=p8cdSyQO94GGzOQVzj2WmA2nBHGOBX9Q4R4Ibyw3LiA=;
        b=LOWHHcYkpEpg+UkvLwlMH0WfdUs29KtRsZ4DT6CzQEXMsYjo8xQ3+g6R4bo8DG7QUs
         6RW3iKjV1ROnqDmJ2C83fYCYkAju3QSmCQbD5zAHBquzo1983uxJlj/tp3bGcL4OLXig
         obCup9vMat814UScZu2gLrggIVHT3NmrpSI1wiDoHIOOM1S1xLbLAy3bOTMsN1+g3l4w
         G7uEVkBHtYmD0Rzl5vPZgu/iZDoTp33MvfFI7RPgejA37aoBrxwFfWrj+dLQnU1sRD76
         r/O7Lb7bWjxwoXpGy9af4PY9Kaf+q+hVJgZhSOHxJ9iUtmoJzCdGKmUi0dM0rIvK4Fej
         AgPw==
X-Gm-Message-State: AFuF++kgCK7gM5aCQQlIcBr2YZ3VdN2YW/OsiE0jjbV+VOVeDaEZwT9B
	I6F/xkaEtcsefQ5T8mw/jwt6qhn86DaL3vi7AC/NPRYaIyJM/IGG/RAZyBnwMbs3rClSTA2PCC3
	W4t9Dl3mstl3r/QsrbyxGyDOXo5ahsZI=
X-Gm-Gg: AYBFou3EBmW3zt4M8rjo5XxtnQfONGqmvk/X7xHxgEfXpbxaeLGUU3K+ETrvfwkTYlY
	68dq/7j/BJH3qEuli6vegl/qQvBhm2z0fz8J3M1DabQGHDe9pFavG5CVdh2qqFxCspUaMp3zaIU
	dkllGARNyE93U3Fu0vi/YTVgM9eyYYKjboNCTi9m967lZ4QTZvSw4XL6dAmTk9PBksM3lewB7bs
	ch7QqP/W2uf/Uy58bSTnUdxPzvgHraB9bOfig6E5pVhT8IicVImxpk6EnCHbQOdotpAuTtXrx75
	32KR1NkJ7STv26mjbyWJIlHmcOidtXGWgOR3hlB5aCSFbVRIY/BCjytukHunS4IyuicAZKzUKs4
	8ctji9k9NmNU=
X-Received: by 2002:a05:6820:625:b0:6cd:3ffc:ad02 with SMTP id
 006d021491bc7-6cd3ffcb634mr1215580eaf.82.1789777700298; Fri, 18 Sep 2026
 17:28:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANcA1gDByZBwvkHBi4Bin-eCzBpN31OHaNStbpi4vhTF-WOAPg@mail.gmail.com>
 <20260915041958.GE106095@black.igk.intel.com> <CANcA1gC3cEuuK1OJkeq44ZZ_7uZZN=ZDkOJH0L-ERUNQcgZ12g@mail.gmail.com>
 <20260915043845.GG106095@black.igk.intel.com> <CANcA1gDh9AKFOdzK+kfLieJByxN1kjFQpSiexKPjHyOY8YMVQA@mail.gmail.com>
 <20260915050515.GI106095@black.igk.intel.com> <CANcA1gDbddDkZAQr_O6njK4PvaDk6nnj+fPsrzigH132u0f0Ng@mail.gmail.com>
 <20260916075135.GN106095@black.igk.intel.com> <CANcA1gCjSCdXz_3+XA5ZOndm2pAL4ZUs93q_69dzZeq_cmq8Og@mail.gmail.com>
 <20260917043847.GV106095@black.igk.intel.com>
In-Reply-To: <20260917043847.GV106095@black.igk.intel.com>
From: Ben <benstaples10@gmail.com>
Date: Fri, 18 Sep 2026 20:28:09 -0400
X-Gm-Features: AcwNN1UWNQ_ghaPFzjfdIgjDO0tH4G0VMsJlutCxinhJcZpk52lGgi8W-wxdE8c
Message-ID: <CANcA1gDFygEN68vnoocpLg10jMQctb3aG_QU55nZK3GuxSrD6w@mail.gmail.com>
Subject: Re: xhci_hcd 0000:0c:00.0 dies with "Abort failed to stop command
 ring: -110" exactly 24s post-init, tunneled USB4 xHCI behind Goshen Ridge
 (ASUS ThunderboltEX 4) + CalDigit TS4
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org, andreas.noever@gmail.com, westeri@kernel.org, 
	YehezkelShB@gmail.com
Content-Type: text/plain; charset="UTF-8"

Mika,

After some headache, I was able to install Windows 11 on one of my disks.

After driver installation, I was able to cold boot and have display
plus USB capabilities on the dock right away.

I have confirmed that the link speed negotiated is full TB4 bandwidth
with either cable.

I'm not sure what this could indicate for where the problem lies, but
I do feel that it's useful information.

Please let me know if it might be a good idea to direct some
additional inquiries at ASUS.

Best,
Ben
