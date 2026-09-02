Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5311633FE15
	for <linux-usb@vger.kernel.org>; Wed,  2 Sep 2026 04:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788325189; cv=none; b=kizV5VRyxnqKdsRc/Omz3MFOBNuYRtL87aHPLAS73G2Z1VvUmbtz1I06VwytD8AFq99xypyqQqrTlnrXPSUzypSRxiFYiBn01LrnF86vV6Y9vWjpIA55KVUaGQWdCzdZtP7qnVnn8xIMidQ4eXchdka4KGyelbHsetZZZ/LgBI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788325189; c=relaxed/simple;
	bh=7RyRS8hdyF+OxF1VODllR54wF9arVpqXsDcwKz4/7oc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gs/t1z2dDwp3g6yUJrW6hHZOXJN2lgIC4cQDiPX1sXoXnAh4oiFITsKn+BXzvExy0f3zhafGsKlAw7gf9TwvR9k7O5Z4nnNt0WLYf5Gi5BA0Gi2nOPS8iJyUafqOGOhOx1XXIYLXJqSya6F3ZpOHbZLk+rBS3T9AVEfW3c/YqPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qqtcuoix; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K0CwtQNR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qqtcuoix";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K0CwtQNR"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681KTFkw2468831
	for <linux-usb@vger.kernel.org>; Wed, 2 Sep 2026 04:59:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2mgoXwqmnTcXL2DO7/E0NK1bU2ELxJUqBbZ
	tPTau3iM=; b=QqtcuoixvThL/9emAbAjLCNlQ2IBvbzsrOIfIFm4tEjQesqkw8C
	HmcgXg6RD3ya1+y2krp8Jmdb7aWTuMofw9X+3A1VEFw1ej3CVGoAne9NtF05NATD
	uJvNolqhaM+yaXS5TA5mgKdtWQmUNlAWjuILbksX2wlPCKyiKGSUCghVA5NNQTbN
	RauJ6iPS7Rdsh1kxRoxfQTJOt52xKQB3WjgxXtoIbkJn9sV94soMOwYQq2ujHdkD
	6OxV5LcMWzdWbdH9oTKjQf0mLksJ1H1AoSHtg01HA3bc/r0OU9kNf+9y+dUliqPz
	Z8yVcKtnPa3iwCTVyXa1TvFBZP1oTNdSwdA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge39cj4u7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 02 Sep 2026 04:59:47 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398e1f7d1a5so1060385a91.0
        for <linux-usb@vger.kernel.org>; Tue, 01 Sep 2026 21:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788325187; x=1788929987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2mgoXwqmnTcXL2DO7/E0NK1bU2ELxJUqBbZtPTau3iM=;
        b=K0CwtQNRIULM0fXR5L/v6RuSohtx7+X5hbFk8XneqexYqV/Mci/4El2UQwL9jvbXvv
         Lc1WzR+O0LVSIW+h62gRk6jaVVz3zEvJg6ZwIcTlAicP+smcS3KR+KThbVgxFQRQQrHL
         hcQ2lSxt4P575sf8ZWP3Qv9DOVcMaKMXY89+gkd/D/CnAOL9iAEw916SV4aS2oWLEnqB
         duGV2AsD1/HyQUmuXoYHfye5MGylSuqzcAMua7uFF9jJYFAqBuLvZMkHmmkLfj0AkhRh
         k943ldvb0IULuQM9gsVEkhGVtb8x/OuxVrpT9Fn/ADw+3N/aIG+s6Kf7U4ojdcdGQxzw
         fxJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788325187; x=1788929987;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2mgoXwqmnTcXL2DO7/E0NK1bU2ELxJUqBbZtPTau3iM=;
        b=dAPdAmkPzNrY/jtoDush0uST9k2ERSJGWu5iAXX9kbCUb1/no9BelzscRHqKxtF25r
         MTjtwkorrJRR/qgjxaeZXfX5FV6C9xOGndv+KnP0CAlL+xBnz6e7Tw1BiquWrJSJHiL6
         E8Kk914ZkH9vVcYqaOY4zdyOHqY9sztFEOPNluXoFWzW2qnlLxrh/JG3z0FlGOENVDEE
         Wqg0XVpnQxjz965sOqFhPLIzURsys5qBxdK2eOn3TS3rJ2rIydew0fdSlppqfs6wqQDA
         otnZHrgyDJ1C721UCzYskfp71X9KrB0QBK/+a8jMitbNEr+rTr92JjNXw5sG1hAkuLEB
         fYOQ==
X-Forwarded-Encrypted: i=1; AKwUvBzddpEupEnZOTquKvGwoi4XJdOL+T8AZtHXcaMA7pzGTGVZVqd9BjbvEmVzg2ODYqIZMNdZZ3VvXf0=@vger.kernel.org
X-Gm-Message-State: AFuF++nxhvwZlUVrzo3rTwlhF9ndZ1T6rIjZlcAAW5kbyc8dZUg97ZJI
	xfRxezC1lxJmd7MRQBSsQ7TpsmBwKlu/d9XkFL59L08ZGY6W8DP1j5gKgNmpRXmA/6gpNLB50MH
	gmkMHSvxyoRjGPn1zGyA+aC8bMq1mpXe055uMj1/5bEbaL4m26sB6YAGqImfakC8=
X-Gm-Gg: AYBFou2KBCUdLvVBRlYmo4C5+WdCx1izWKqxOEH9pH2lRIRyyUtZbvxUEIZsAW+t0iU
	jKR1ZTghl25SaHX5E76AAyhw7NQgcbdWQdnSWDkT4Q57cccXNmNm6XrtRuMkUBqpuh3IfgbhS/f
	s1bm3Eo8CpmvAI7XWHv+FWL3NRR8sdjEeqElbQnJdhDswi6IIKG1PfXGQZ+RQ9rK1esinokk2eR
	Msc5+3RQx0zZolv64DNsEtu9QFEqDfNGx48Fiz10SX9NVUWsstL/lqlC77BXxrOzQVTZueBrFgC
	S9xqVDnzrOw7QmS/26UCpDFUf2oEeyk9qR7zmDo7G8wPJmad9yLg/8Aw6HloV1cs1ZM5OYZnTV5
	s0RIdsipDPmpaJEV40VpGHf3meZa5t8+mmxmJh3Fo9RJ2CnK7s0VaTFn8RQgs
X-Received: by 2002:a17:90a:dfcd:b0:398:ba0e:96f6 with SMTP id 98e67ed59e1d1-39aee1ad8edmr3396400a91.23.1788325186765;
        Tue, 01 Sep 2026 21:59:46 -0700 (PDT)
X-Received: by 2002:a17:90a:dfcd:b0:398:ba0e:96f6 with SMTP id 98e67ed59e1d1-39aee1ad8edmr3396331a91.23.1788325186252;
        Tue, 01 Sep 2026 21:59:46 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1430ea31f1esm2782639c88.8.2026.09.01.21.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 21:59:45 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/2] usb: typec: Add onsemi FUSB15201 support
Date: Wed,  2 Sep 2026 12:59:36 +0800
Message-ID: <20260902045938.184221-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=T968ifKQ c=1 sm=1 tr=0 ts=6a97ad43 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=r0Oy5IV129DxtwVnk4EA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: -kw7QeaEDCNVq9TPyqQVUaUAE35z3JuM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA0MiBTYWx0ZWRfX9nNdjaTiaSHo
 udqcLNhX0ZRiJRdl5gDdBU30pNOKx4N2Gy5RJdrkQAe5fH4p4AE5vRJ37eXQn6AX0NfOjjZf+NI
 qWgvJg18TQ56Z06A27C4t7r9Aa4Nu/Q=
X-Proofpoint-GUID: -kw7QeaEDCNVq9TPyqQVUaUAE35z3JuM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA0MiBTYWx0ZWRfX0EIIe8hLY6CF
 Obyj+2DVQfA9SYxegHmgpp8ADFq+o5HE8PvsMnn1oa3eAGLcZWYLLoPk9Oldskg1KgBn2nBmAo8
 V2Do92bNTo5WSN0M95sBbf8JjKxG0IIDw8zE1ydvgz+3LcponxxDiO5OB5E/iWA2j3AmBte+6BP
 Dl3xkWmChuLKzuHUYGigKrVLzW/ukUhPH/l23pl1+m0fpZVNBCiBrZ+3pfbuXoGkzVhNMOFmGui
 MEkAPmbdaGCl3z85ku9IxDCsjn8Ex5r1TjcZM5qTsBtUjid8TG2CIqLLKoAH02vdV+G1kb3tTse
 QASeatwIzKwz0kesYHz9fNK17U1mYtBntNPbISd5GY4R7DrH9e/Z7/27u65VSA/OSVESwsSY92M
 psmMMmmu6xcyWImLcygc5drjNRFLAZsD+lfpMLXtcQWiXOX4wNaYGr/ytKURhYq0q0tXL1543J+
 t3WP34jT8w2+Yqmdtyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020042

The series adds a driver/binding for onsemi FUSB15201 which can be found
on Qualcomm Nord reference design boards as a dual-port USB Type-C
controller.

Shawn Guo (2):
  dt-bindings: usb: Add onsemi FUSB15201 Type-C and PD controller
  usb: typec: Add onsemi FUSB15201 driver

 .../bindings/usb/onnn,fusb15201.yaml          | 152 +++++
 drivers/usb/typec/Kconfig                     |  17 +
 drivers/usb/typec/Makefile                    |   1 +
 drivers/usb/typec/fusb15201.c                 | 581 ++++++++++++++++++
 4 files changed, 751 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/onnn,fusb15201.yaml
 create mode 100644 drivers/usb/typec/fusb15201.c

-- 
2.43.0

