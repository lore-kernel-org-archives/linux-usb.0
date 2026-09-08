Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F1E51476B
	for <linux-usb@vger.kernel.org>; Tue,  8 Sep 2026 09:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860988; cv=none; b=oaXcgkbrR63c9TjEENqkeQBHsDAqWURtwVkn+EVffwNsDiuDR7VXUn84woedn0sAf/AwL2tpz3KX8tKt11L0NHLmATcr1h9vHoOaBy8stGdQeS26k4l116E/m5NIydgV9L5+zqIAWdqU65AYPJnFPhhCc6mRhPveZSiDtXVkA90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860988; c=relaxed/simple;
	bh=r3pH6S6EJvO/rnb2oF53pIGnhN7L30DwtJFx3rnvGR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SdVwxhhtWMXLx1o5v8StcCtio7EWDFFrXglcIf2KpTb2okyYUkuccgn6argkcKGWRnDbwBZ3OaqvPZVjU+GU825mJLwHyJsXRjGtZENTCIA58qN+JwjT1ornHNCOu3/rJj5fvPPp+E+rKSyunRURzsGz6+aLGZHil4neg1cfnN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aDUWRrpB; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aDUWRrpB"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc439bfb2d8so2725643a12.2
        for <linux-usb@vger.kernel.org>; Tue, 08 Sep 2026 02:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788860985; x=1789465785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r3pH6S6EJvO/rnb2oF53pIGnhN7L30DwtJFx3rnvGR8=;
        b=aDUWRrpB1JBjvsc2tLez5Mphb29iakeRu0iiJqOEb8PfcFFfTZa4h/xvKhcA+gzygy
         R4yD+CbIx+ExRbRB2ezitOrWuUJKnwWT8PsjdMcW6OdOPLa35yIuNBb82yiH2h4V/+qw
         /I9TiecEvnRc4WTlLn6A+M+Uhm7/4LHAyIoljWE6Fgm3V5ZoJ6rZ7dH/l2cttKkJgtIP
         jAzJ23iKCTQpiQ/bOHfebP+8mmskJ0RQnV8mZRfSuXi0yutZ8iyeJaObLmmGjRMuMroe
         tRDtTtEvrAyY9b2x+14kPSaG1C2LroAy7C1JX4bXinTQtK8VB8RkPKQc2ctR9rTHh7at
         6lJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788860985; x=1789465785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r3pH6S6EJvO/rnb2oF53pIGnhN7L30DwtJFx3rnvGR8=;
        b=D/B8IHxWv48aPchPX5XSeINLlwVw6NHSayVPNbb7ZgMVscSZ659MIlkb8tcdWUj26T
         8UJzKmPM08BSHcCn3d2p/WN/uAWegZvJ3nrZsvL9qTwPQKr7qmLPZLQWW8N2/2RCwhSE
         3wQWtaWbLBbzuNn2gNdvbCgl6aSGoBSRRM5fwz+W2jtfKSl69WH8qcrCgyPXy2aQypKP
         mDZHXMtUVh9epxt1r0/Y90PJFnhpoCw1okE3zSK2K8+6Bvu+p1uPhAJACzWVmndYEE0D
         6oFCDysXEAcDdJopd7QuRoVeq8gOXwFowzqiqsWSHs2vLzJ3lOVHnFVJUzt/KQ0gbimS
         lapA==
X-Forwarded-Encrypted: i=1; AKwUvBwDhMoMU2l2jwtv7hdqnZ+H8kci+kDotIHOS7oirCzFnKztoCGcEqcQhxad94bzsSAehzCA5/UBFRo=@vger.kernel.org
X-Gm-Message-State: AFuF++mBkNfRVivr1kS89YutnngrUJFw4GnEo7kXtKR6Qe6wW8zGaI0P
	FLSKrxwq1Z2KH6dmch/+BRhl7ioI0TZXHKaxRGJgs2w6rGq/VxFEvs8=
X-Gm-Gg: AYBFou1IgTws49lbY4/eoxlWmhWnL5p44a9PrYaWWMJvm+oGrxkFdj73FI1IljzbXL3
	CYyaLlu2WTaR4c+7rlkfkAgPG0gJxETqY07itHfeJrsP6NMc9N+7VXcMwIBSnio9vOpAEBsIwQy
	o2Ro0aJHl0i8vPUN4wuLojZYsQIkxdm+r/ahpm0HXb1DZSCJsU4awJ6WWoPuzsESb9Ro0hfAaKc
	LWlecS7hiRva6+EV92W/ZSkWGe84r0OsAk3uay3KVraT2FivDMD1p8cxZlruFbRDZMa/xe7oFA2
	FM8J1UHT6o0NAFxuuy4Vfn46EbDHPzWCdpLh3Jx2M7uyjRtmuqVmxDRJdDzpfigt4jexksxpYss
	Hy5Z8AukeNNGubqWpf2Pu0qw7/As2tDc/lpAWKsYHw9jBUFbD4DlY/Im+LFjr6ENVJQhS050JH6
	Gicu8K8RnLcBMZ1xBMGzKvfhgoURvr5Y4c//M4WiRLABV5t4cMOvI8Rp76127BLG819m1lkpTSn
	EBdeF28oEpjD3e49Wfwig==
X-Received: by 2002:a05:6a21:9d84:b0:3d3:af85:eb98 with SMTP id adf61e73a8af0-3da3a16a579mr45039412637.26.1788860985252;
        Tue, 08 Sep 2026 02:49:45 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009.. ([27.60.17.8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33450e140d3sm29309121eec.4.2026.09.08.02.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:49:44 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: mika.westerberg@linux.intel.com
Cc: YehezkelShB@gmail.com,
	alexander.fischer@kait2en.org,
	andre@negmaster.com,
	andreas.noever@gmail.com,
	atharvatiwarilinuxdev@gmail.com,
	linux-usb@vger.kernel.org,
	lukas@wunner.de
Subject: [PATCH v10 0/3] thunderbolt: Add device links for Apple T2
Date: Tue,  8 Sep 2026 05:49:38 -0400
Message-ID: <20260908094938.1175-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908080711.GZ106095@black.igk.intel.com>
References: <20260908080711.GZ106095@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Appled these to thunderbolt.git/next. I did not get any reports whether
> this still works on the Apple T2 system but I guess silence means "no
> issues" ;-) Let me know if that's not the case.

Sorry for the silence, but yes the code is working perfectly fine.

