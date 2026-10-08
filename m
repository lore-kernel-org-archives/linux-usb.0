Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EE141A93A
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 11:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791459502; cv=none; b=k2YTIjjX9nRo1ZpEJQrpKdLhoRBS6Zr8iLVFUv146gmJXp4Z7Ac2rweDWbRn+flgyhnuyw0Vz3XDDad2lqMG69aA1Aqv9PTVjYubSuaUNU4sfOD0uAFLLQ7LbIweFrMqYdT9cVU+cuhVbrVsJZ5i5zCF/2/U+7JNwroMr9g4Its=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791459502; c=relaxed/simple;
	bh=9e7W2f6a3jz8YGTOd6N82PW0wtiqPYTCubq/Qgl0fLk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bLZMMBVmtS5fCZbEavGE6YaDp3LUPZAGV5PihEMW/EVew7rr2i8NbLjPOP8YZLRitU/o9i9KZ7ODPIeKFkc/aK3qrqBY9Vu28XYyFHzX0yUCzpZUiR4/fdvrH18T77PShRM6uXONTQwaVnYNVDQ58WhKGJqIgUc0vqNiexb8wcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g8XPJuhL; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g8XPJuhL"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc7e79c1eaaso1382462a12.2
        for <linux-usb@vger.kernel.org>; Thu, 08 Oct 2026 04:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791459500; x=1792064300; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9i/+azlZLZIzmsgzlfAJlh5HU5L+X3Dl1o5h/G5ZaiU=;
        b=g8XPJuhL7dgS4teR9JbxDxXm0RpOZjwXlvgP1eohhNIJFTl+fA61jgcy/N+bFNXMrp
         MXSYTGtc378dR8MRHcGKYwfDsFJnEf/oac9mIQprw466khBgOGXJbW6sORymSOJ5ReSO
         xcdZW9TRxniPA/DrP4dI3FfQ/fkp3k0zeMVOZnzsf2KpKEcQAOBFmuaY6y7I5kwvUZkY
         C7Ee2UUPiFs1163+Nv5uZTUJce4kZ0gwoz9LK6qXiAzG15P7vni/uwRK3/HEz4xPyVT4
         ZyUnb7E0Ref+CW6L3jnEEXWa5rhWcdQDn78wUuh3bl7mHnAzzIkxPJgW9PUmKd6saH+E
         92UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791459500; x=1792064300;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9i/+azlZLZIzmsgzlfAJlh5HU5L+X3Dl1o5h/G5ZaiU=;
        b=0JVtI6xRfott+CiNc0HqLlFiH8u03hiYBmduBkgR6XpAeBusBOdnGBrWAhL815RJ4h
         Rku2s9B1UWbExRI4nzpT1S7ceLsW3XPupFGWhS0EgSnpfC7tZ1P0w79y7SnghQG1NIeq
         nzcL21qmkUMet0LbKiwcIhlJL9WJZqto/58i3GKduKb2ax4ybyOiMcSIjyKPCLDFZKey
         9kI9EOBpQrOF5urBcbGVhpGsp8WMzPosJ5ON7ojoEpUSe9WeDfsOtRk8CyNJbQoUKDWQ
         NbWDtsPDWFKOxvkBvr3WPgyroLDUU+/6Ritf6f9hpF0Hl6ljetXUY5Y4FZbYksX9haAP
         Z8YA==
X-Forwarded-Encrypted: i=1; AKwUvBy1xvolefKTfkh5/1p4ocRQg3DM/yMOikLi+IACEilhHmfra9hPKzHG41OlRZ4FKNWPMn8UF3OmefQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIuCIl6yPfmo//dC+HQt2eyqa8TMHCs54nxqb4L24L77CWFp8T6
	IXfAzavkw+Pks4qtHafsImzt5YAFiL2IrmkvJ8xePRjOkp+a6OZ0A2Pk
X-Gm-Gg: AYBFou0I4RLDUGctSgaJUc+Upfp9IlR+sTWbR1QI+jDU3bam/vsrGWZ3lFTc8dchNah
	oi+bRxUgldZ3pf7smZIEWfOX+bcD6iYvqzqQ325IvcCvubujwk2MIkebKlfy4fRut+N7zsZXLfy
	uxYACfq3sSe5cos0wglhXkFaWm5V4uKSe2SsJWx1pqNs0xCUVbfkW+iKh4/4G9ij8T9+nXYobiT
	UQTeBi9pBoowBS6nggpwj7BUduCFcN4MEnxUb48d/vIHs087WOVsi6hqsYoT0YxFmH9Wdy4mnKU
	btWvHuatdT0STlW5YJGxxlN4sOY7ePKgxuFq3dYu5/tjVT+eyANtPDNhHIMEmsxQkhPDw/2UioT
	nR7UuxM2t2Vb8rCkWRI9Mwmkh7CEWlaOs/EVB81SwGP1mWRNDN1H37MK/XHhjk/igOQjWfweSfA
	4O7RGJmBYF+IVG9V0R7h7KI0k1MYwCWZvacN2JvOPj7Sl2lJULo7g21ZQM13cil4RGFndi
X-Received: by 2002:a17:902:e74d:b0:2e6:13b1:e196 with SMTP id d9443c01a7336-2e613b1f621mr35425745ad.74.1791459499719;
        Thu, 08 Oct 2026 04:38:19 -0700 (PDT)
Received: from gmail.com ([154.91.42.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e60482cab0sm22616365ad.50.2026.10.08.04.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 04:38:19 -0700 (PDT)
Date: Thu, 8 Oct 2026 11:38:13 +0000
From: Zuo An <zuoan.penguin@gmail.com>
To: linux-doc@vger.kernel.org, linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] docs: ABI: sysfs-bus-usb: fix typo in path to interface file
Message-ID: <aseApS_MWoP3Jtp0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

A path was misspelt with the delimiter between the USB <config num> and
<interface num> as "-", when it should be ".".

Signed-off-by: Zuo An <zuoan.penguin@gmail.com>
---
 Documentation/ABI/stable/sysfs-bus-usb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/stable/sysfs-bus-usb b/Documentation/ABI/stable/sysfs-bus-usb
index cad4bc232520..400237db166d 100644
--- a/Documentation/ABI/stable/sysfs-bus-usb
+++ b/Documentation/ABI/stable/sysfs-bus-usb
@@ -60,7 +60,7 @@ Users:
 		PowerTOP <powertop@lists.01.org>
 		https://01.org/powertop/
 
-What:		/sys/bus/usb/devices/<busnum>-<port[.port]>...:<config num>-<interface num>/supports_autosuspend
+What:		/sys/bus/usb/devices/<busnum>-<port[.port]>...:<config num>.<interface num>/supports_autosuspend
 Date:		January 2008
 KernelVersion:	2.6.27
 Contact:	Sarah Sharp <sarah.a.sharp@intel.com>
-- 
2.56.0

