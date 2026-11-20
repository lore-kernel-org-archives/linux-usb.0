Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795195901;
	b=Ba3Jpf/2iQJRNt/SpQa+S3sajRbgirOeJiUXZg7/OVeKabelUUgfFcxuhSLfvI1BHphR
	 eGIK9lnrKLfmPJKcEGkzMIYs5xCrVMFm5Lf/U/xbUx+ZpQMANVuv9i81XQc6xOkfYACZZ
	 7g/ysjSHe/N0/ztr4T2k0qp9aF4VNN2AQ8FgbLNJ/Mk1nOEOHBNBVd8Ve2ZkCgItEI77/
	 KiM0mFcy5GOq3FxXxVgTjCkuJYFvlVE3/P7stFeQ0jXibUZlPYPSsIJzNW206+x7p6Ith
	 DmBWxtno2ObX0JnzUOj8DwX8jR5FEi4dXXHNDHJvalH4pyY1E0PyuDYsr+HwlObCWdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195901;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=bxKwdrIUuzixTrlHwEraSTTfViGb7kgcBDYdj0LG20I=;
	b=Vl0tXvvXuwhYgKWgBlLlkVRkhVyDQTHsihfB4G+JpF8gTxt524x0HJjJIW3Hvqr07P2v
	 e5iRFnLhyXUDlaaItkq+VIOrkYosn+yA98Cmro2+sKw210lwvR1rfLZzs0NJHE8Qi9X7F
	 jLOfpUtdTd8lCBw0h9gvJMekM9RYT7TcxziNtF79+vala0Pr5JLVcqvnJTiuxMrkZCEuW
	 XPAM2Fy3BkeCNIKK/A1TJndT9Pua8RrSI07tmT3vy4MnXza4LsF+FsBBqFpqYLEwIZCEC
	 XZlCZEOc3gugf7uy/DbO/iLUf3uhUbZus8/FmXl0t92jqpxaID+5sWb/plLO6wATVAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=h6UztEPa;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4C260A2628
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 17:31:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C4C260A2628
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=h6UztEPa
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2f00fc215f9so8244615ad.0
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 09:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795195900; x=1795800700; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bxKwdrIUuzixTrlHwEraSTTfViGb7kgcBDYdj0LG20I=;
        b=h6UztEPas0J1ez1Yuh9unLqPaR1gDwtjlSvghhiSA9vaXNPrRi5uxF5XEJRGkESiUd
         lRKd1Wx9WDP6/GvtOIgzygcN8Ir0csDzBM47drzwYJkDExX7qaqcrGuvB5kfqo5AgVyn
         tCgkqmAja/nlGi4MFQMTlf/BWdsQwRzgAChDghUENbT+UCRDtKEo6NCCned5mLOSgJFC
         VcyluTbKGOOqYmC+NIOZqGt1fcOy4nMjdTuJCGIJsNUktotD4q7DQVgyF39jjv95aZT0
         pjjbTtCPbYJmKL+VT/Fy9v4YtXuX7drAsoAk1VQTGMiEivSpHruSjmRhsEEmpErZRVur
         fo4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795195900; x=1795800700;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bxKwdrIUuzixTrlHwEraSTTfViGb7kgcBDYdj0LG20I=;
        b=psMwVdWexKQR2bIgWV+hkWt/VcAdzG/dVeyDs1d3z7QV9qDX1y/L5H5lYQLOa+Osd/
         kfpTrTfOTZFgLT5gUEKr3zG7gpClYcWUvo6mlXfeDS1836Dh/9oksjmLBWmXDcVvuc3X
         Lxl90wX+7kU+3EFqk5/jHHzBpbyWvLeVBywd2c8yU4MiPh6i2k6rDgvwo/7yx8r+vXhS
         XQ+ifEoNERZeUYBWim3VTAbeuxYkFTBu5VoECIF34litGadFPTi5QWcF1hLvw8QtIpk3
         Gb3OhVeJKjz+oSs8IQl/GLUSh5i3UUTW4YDrT11OUgFGOKdHoCbZy9IhjscVK5ttJz1e
         OLhg==
X-Forwarded-Encrypted: i=1; AL+hErGt1Vz5TWWrhiiKGXfkcwKa2Lx+a2ShVAXBi+Psaz6vH3ZnkIl86LmZi+HykI++lqP3Buc8z8lBTRI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yVklILGhAi1RwHY4vhyMFjjVI8v9jf0mDZwX36plvZPfWxEgT
	Zsl00f0zi7WR5FTR3C7OfSya8KuNNLyWTePV+dZC/yc4GTp0b9ZFd4wr9vo1PMGF1JA=
X-Gm-Gg: AZFdTZf22Y+6/d2zRhtE+raASVikyPHYUqk3i6KWdZFv70PFN4MbCH9G2E2TMMWTov1
	9ZpDv8bVhhmdhv63rlJsCRz+/VciX+8jfgQYW0VAhe+Oc39JFkVcTDkzz1hyMx4x4mE8A7nqEcE
	6Xao3UVtMiP4MOYuzd0feNm3SIWP2DFfAbjmuNWUIcvPonNt6+ZTG3fodfSbVZ1Gi3bhVg1ilvp
	NYMbB8F3eQcX58Snm1enK/9uJQ6UVLAYxLv9GnHEXUDbn3BhN6tM4kXjKhQxQpdSo0FqmcHEHf5
	krxziLMjDfIur2w8fEQl/njBJitd0SrKw6SIDyAi+WUbW/qius+lGbXTcI5unZIHcQrfML1QfKV
	j8PBPWzbCKbiMoGZzjFrqfi+wSrRXp8Ilu39Tcix7dQ/UsUEnMSmsL9+TlQtlJY2vpmezplU/Z1
	jjDhHRNY9zLzvbylLEeXvwYDU0/KLM4tfsP6pKNiX/h7qYxxJ0PR6XPY6A84dvOYghgunoPiuKO
	ofIqUagvF84wIFVNnNGu56//2STM40yxZuBIvQY/u+kRAgaij0V8qp1EHsnhxBrN8HIR6XRwdcp
	D5g84oNVNvqAGIVpYOJymcVczO+H/s7X8myjlH0ZYH0K/f1Mdt7x+tdKp3dPjfwfqUsATeoYIrL
	5ahOXclk0ZmP9l95P0vBbhLoI/NEVyeDkCfSr
X-Received: by 2002:a17:902:dac1:b0:2ef:f819:3aa1 with SMTP id d9443c01a7336-2f03f1f0a26mr46054785ad.56.1795195900424;
        Fri, 20 Nov 2026 09:31:40 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1482c3sm17173225ad.73.2026.11.20.09.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 09:31:40 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org,
	nkapron@google.com,
	linux-usb@vger.kernel.org
Cc: Thinh.Nguyen@synopsys.com,
	bigeasy@linutronix.de,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	benquike@gmail.com
Subject: Re: [PATCH v8 0/4] usb: gadget: f_tcm: fix infoleaks, sleep, and UAF in the BOT path
Date: Sat, 21 Nov 2026 02:31:34 +0900
Message-ID: <20261120173134.3286557-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118124005.2428068-1-yhlee@isslab.korea.ac.kr>
References: <20261118124005.2428068-1-yhlee@isslab.korea.ac.kr>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, Nov 18, 2026 at 09:40:01PM +0900, Yehyeong Lee wrote:
> Yehyeong Lee (4):
>   usb: gadget: f_tcm: queue the BOT status requests with GFP_ATOMIC
>   usb: gadget: f_tcm: zero the CBW buffer the status path sends
>   usb: gadget: f_tcm: reject a short write data-out transfer
>   usb: gadget: f_tcm: clear the scatter list when reusing the BOT status
>     request

1/4 is in usb-linus as 69b3b657087f.  The other three are superseded by
v9:
  https://lore.kernel.org/all/20261120172829.3286180-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
