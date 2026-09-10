Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD183C9EF0
	for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 09:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789031886; cv=none; b=TC27nnDUJ8wOR9AuT9hmGGg1MMv7UePg7D17bXWVu/L+bucpzeRXWRYFDz/0dQ1yTbtKCrSBJvvx+XDUrzXUQLMSv5Tuuvcn0wDyt7UTrNHOzXbji2+73SYLceINdqx/ZVqFwWoKcfgm3Yuj19wzS6ENsfC2sgTez9TbCK0P4f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789031886; c=relaxed/simple;
	bh=oMsTPVxD3adyYqXrZsEmwysubsy2RQPrnblfLqNinT8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=avN7P2uqiZl/W8mqsSjwIzWDQGyyrUE4UJMyn83LFScqgrnjIiSc7608DijeqABoM3qbk0NFCqRFZZMrW1AjA9wcEW+C7VTpUcF9EozyO0gndmZ73XyB+cNI1tU5w2muDdaHMTb+jmvOuOR3rL8AT9YUx6fMXWGh7mmH532XhE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mcL+gMAE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hwPUfKdg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mcL+gMAE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hwPUfKdg"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A8xYfT3468714
	for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 09:18:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=34EnVTQRCQOFDP/vleefO0G84CYKnhKOKiG
	flj4Zs4k=; b=mcL+gMAEqYPl4aemhJWYDtTHCKbeNWmqxp7JRl+KojLCtxEZbW9
	w7IEfNqNK+QPt6I64B0Mdr7RLMnAVlj5FwoBTdUFvQD9dtSi8kz9AGsLJqijJ8wI
	buH53sKQEkkWgdLRrG+JfgMKpFMoRw1HSFfXjQM27LYLv7u2iYK2sJuKHJDGEY+a
	D84vEW6sYSGAjWR0BtLozQQWlC0pykonftxWR/eere2xWzbc4XiBgPdtdNkyL4Ma
	zq+DBqrGaHIaoEesBNWAIw/OTx2J1YVCT0p1DNoPCnydcvSL1egok2kDlCK5mBQI
	5UowIlzifqsTi3PZNkxxVCVBuHK7dr0/lNg==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gksh8r35q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 09:18:00 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6b1abf73d1fso3761917eaf.3
        for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 02:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789031879; x=1789636679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=34EnVTQRCQOFDP/vleefO0G84CYKnhKOKiGflj4Zs4k=;
        b=hwPUfKdghaB/oh4d9iaAtljQYaQvxxj0ZqQK6l3m9tTfD/P66wLIXY0fF8lG4cA2gz
         NAFZmOkfpII1luLLCbCCE4tmmGvOtpHESATN/27IHgH4hwDcI+RsTva/EGQ74bAUHD7L
         tZgSXbobwqnCuOkGrSS37B99TFShuz+nIUubjPGJ0jaxI2Xa4Ar5EtrDNddgnNd/mTEm
         Wf4nF38vNFfwTuLC9EoXnzdrsu9o67UzfJEY+z5d62AjfXa8WARSHiFGI7mjO2WpcBq9
         96NfFde5zqj6hnQai3iaTaNi5oRhozUFo1TjXjNsDwP+hNESCXSzzSBUye+muGiNxUf1
         KYLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789031879; x=1789636679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=34EnVTQRCQOFDP/vleefO0G84CYKnhKOKiGflj4Zs4k=;
        b=GblYIdPzR8ZBRmkmWjZOfbGCzNaCEq+kA/ZvhFDo4bCTQjbS8Deau5ShDuIza5Ogyy
         tp/ndYHgoAF5gqUIqChfearrs1+dMwSQQbSKwPo+spYaKaLmnE95lGyY9+E3feqVY+lt
         FCGwI7593CTap+j7XEoRoJ/07sYZrFMZVDRTZxuVImZdAD3z3ss12qBt8tVu/3BKO7Ne
         iAN0/g+Tpt9TpL3AgplYMt1fXxQDrhWAarZAe2I959bCu/eibUAQkpr+syn5y/buQp2/
         2hTEGa48Bxkv3TnRtwXAe+FOOT7rtntG93NsfDNd14Di/ZxBl3t/ARPQAqCkACTWjfe2
         ZllA==
X-Forwarded-Encrypted: i=1; AKwUvBw9VJ8BDtdxroUdnQss73QNK6tO/8Rwr57WImof0rHeOJrkDJnJTwGs+Hv9vrYLtJzDRtRnkfoa7eI=@vger.kernel.org
X-Gm-Message-State: AFuF++loginkEt/Ucb3r4JUI1bhZSTkSGOHs7nNIQId9Te64cEBVzXY2
	wS8l5VeeMHFtEVP/vdbwOFV0sU+WEqVJBtBOGUFESME7e9bVCBgKnSw0BiiC9zJbMofTWwTVjgI
	vCuGt8gIFSaLfUqVvxjNZxNJfAFq4U2B6dG3UBHwzZ3DC2Rzg1AWq7e5aMjbm1EI=
X-Gm-Gg: AYBFou0VJqhFUz8Up8adb7hy10lOzPESrETyB9/6RHss89trtdt63Dlj9QWFfZo8/w2
	km4h+0/RO43h0inqiqeMiSIdnSW4171L2YDRX56G4GKj9n8F3pQBLBTxyC0CPcJOfQyICMibClB
	hi/C3ZIZPx3FwBOECAJSBpXA3YWnEHXJBWQ8rPnvE85/xQN6O2MsjNQCfxHOxwCm0869RTzpkt0
	ZK7TnV0Eu+skrGeIl8jK0ZF50iqBYSF6251aJ2cO5Fw/oVuKCDfOrBfUqPaQ++3inbWzhGRQz3r
	yZi4T1f7xLqkGWo9gJ0Wnhbg73y5sjdOPc90J9hm6VGhGegGduE3iZ82+I7VvwDDfEnDaYZ6kB9
	2CivW8ip0yLTYVNT1mAgNRtA4JkhWDwaHqk2U4rn0lo5epSM2kVLZgs4I1rMY
X-Received: by 2002:a05:6820:4dc7:b0:6b7:8396:f3d4 with SMTP id 006d021491bc7-6b78396f84amr19858893eaf.54.1789031879217;
        Thu, 10 Sep 2026 02:17:59 -0700 (PDT)
X-Received: by 2002:a05:6820:4dc7:b0:6b7:8396:f3d4 with SMTP id 006d021491bc7-6b78396f84amr19858879eaf.54.1789031878830;
        Thu, 10 Sep 2026 02:17:58 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1433171a97esm57395988c88.12.2026.09.10.02.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 02:17:58 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 0/2] usb: typec: Add onsemi FUSB15201 support
Date: Thu, 10 Sep 2026 17:17:49 +0800
Message-ID: <20260910091751.819264-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: LQlCvmcTECEjxzczlMSNikd1UyxxQ69k
X-Proofpoint-ORIG-GUID: LQlCvmcTECEjxzczlMSNikd1UyxxQ69k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDEwNCBTYWx0ZWRfX7736WzmXXCHL
 9w8bK/QFAOZ1wfKqUEbL+DQbb1UfZIz+tAV3REFUMBiPVxoKrEggRGag0smpqLDTE1yS8FY18FZ
 1YeKkKQaT/fpLBpLVErA76MjaaynuH9mm0+9SY6vV4nNoqGzFef8Vm1Bp0wKeM5NoBIt/ay8TTb
 LE500M8aY6yK83T1Ik8omkmstJj0IM20m1MNy01dVu+afaYsU2c9qOE+eAx1rBnA80jGwChgW6e
 c0ys+8btZwQp8bKkSXEJv8TWwcpIdsa2vD6uGTOzcvHBkcynsZhbjheCsSzV3nxhEza4s0JOyi7
 v4MUQ0G+52Hl5DcKuWtfxL0TnWdak60QYWxTRn4m0sZIfhF0w2JplpWZl4phvU2Gq3mdVqRixOc
 DedhUBQtK9KEKO2ec5FHcRnPjrigpwmwfJ5ODfqYM/4qu1DmTjgqzIEiY8FbJ9cEBWLjN0Vc0K3
 tLafwO3fSWd2nU84q4Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDEwNCBTYWx0ZWRfX845n2Z0LHPOE
 hlXlkmmxgUGUnsQ3VxZO5Fr7rx6nGuqCMFtvqlYnA4lnoHRHj6s/8NJTIdovUUtp84gAIyi0SjD
 GdlHBtWOp9UniqnkMv6e8sj+wFc9nbQ=
X-Authority-Analysis: v=2.4 cv=a56lZkSF c=1 sm=1 tr=0 ts=6aa275c8 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Sth0529Ve8dJX5Jf890A:9 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 adultscore=0 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100104

The series adds a driver/binding for onsemi FUSB15201 which can be found
on Qualcomm Nord reference design boards as a dual-port USB Type-C
controller.

Changes for v2:
- Drop include of <linux/mod_devicetable.h>
- Link to v1: https://lore.kernel.org/all/20260902045938.184221-1-shengchao.guo@oss.qualcomm.com/

Shawn Guo (2):
  dt-bindings: usb: Add onsemi FUSB15201 Type-C and PD controller
  usb: typec: Add onsemi FUSB15201 driver

 .../bindings/usb/onnn,fusb15201.yaml          | 152 +++++
 drivers/usb/typec/Kconfig                     |  17 +
 drivers/usb/typec/Makefile                    |   1 +
 drivers/usb/typec/fusb15201.c                 | 580 ++++++++++++++++++
 4 files changed, 750 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/onnn,fusb15201.yaml
 create mode 100644 drivers/usb/typec/fusb15201.c

-- 
2.43.0

